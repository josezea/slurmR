if (slurm_available()) {

  cl1 <- makeSlurmCluster(2, time = "01:00:00",
    job_name = "test-makeSlurmCluster")
  cl2 <- makePSOCKcluster(2)

  set.seed(123155)
  x <- replicate(2, runif(200), simplify = FALSE)
  ans1 <- parSapply(cl1, x, mean)
  ans2 <- parSapply(cl2, x, mean)

  expect_equal(ans1, ans2)
  expect_silent(print(cl1))

  stopCluster(cl1)
  stopCluster(cl2)

}

