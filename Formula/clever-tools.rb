class CleverTools < Formula
  desc "Command Line Interface for Clever Cloud"
  homepage "https://github.com/CleverCloud/clever-tools"
  url "https://clever-tools.cellar.services.clever-cloud.com/releases/1.0.0-beta.14/clever-tools-1.0.0-beta.14_macos.tar.gz"
  version "1.0.0-beta.14"
  sha256 "e74bbde92f954e1c6d0dd269eab6f1e6f9bacf7cc5b4ccd3e6962931cab87fd9"

  depends_on "bash-completion" => :recommended
  depends_on "zsh-completions" => :recommended

  def install
    bin.install "clever"
    system "mkdir -p #{prefix}/completions/bash"
    system "mkdir -p #{prefix}/completions/zsh"
    system "#{prefix}/bin/clever --bash-autocomplete-script clever > #{prefix}/completions/bash/clever"
    system "#{prefix}/bin/clever --zsh-autocomplete-script clever >  #{prefix}/completions/zsh/_clever"

    bash_completion.install "#{prefix}/completions/bash/clever"
    zsh_completion.install "#{prefix}/completions/zsh/_clever"
  end

  test do
    system "clever --version"
  end
end
