library(httr)

path = "contributors.RDS"

repos = c(
  'Grid2op/grid2op',
  'OpenSTEF/openstef',
  'rte-antares-rpackage/antaresViz'
)

load_contribs <- function(){
  if(file.exists(path)){
    return(readRDS(path))
  } else {
    return(list())
  }
}

scan_github <- function(repos){
  ctr = lapply(repos, function(r) {
    content = httr::GET(paste0(
      'https://api.github.com/repos/', r, '/contributors?per_page=100&page=1'))
    content = httr::parsed_content(content)
    out = lapply(content, function(x) data.frame(user = x$login, repo = r))
    return(do.call(rbind, out))
  })
  names(ctr) = repos
  return(ctr)
}

save_contribs <- function(new_contribs){
  saveRDS(modifyList(load_contribs(), new_contribs), path)
}


contribs = load_contribs()

new_contribs <- setdiff(repos, names(contribs))
new_contribs <- scan_github(new_contribs)

save_contribs(new_contribs)

# list of contrib for each projet to data.frame
ctr = do.call(rbind, contribs)

library(visNetwork)
df_users <- data.frame(id = unique(ctr$user), label = unique(ctr$user), shadow = TRUE, color="purple")
df_repos <- data.frame(id = unique(ctr$repo), label = unique(ctr$repo), shadow = TRUE, color="yellow")
df_edges <- data.frame(from = ctr$user, to = ctr$repo)
visNetwork(rbind(df_users, df_repos), df_edges)
