terraform {
  backend "s3" {
    bucket = "practice-test-amit"
    key    = "practice-state-file.tfstate"
  }
}
