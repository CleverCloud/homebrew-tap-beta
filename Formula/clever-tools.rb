class CleverTools < Formula
  desc "Command Line Interface for Clever Cloud"
  homepage "https://github.com/CleverCloud/clever-tools"
  url "https://clever-tools.cellar.services.clever-cloud.com/releases/1.0.0-beta.13/clever-tools-1.0.0-beta.13_macos.tar.gz"
  version "1.0.0-beta.13"
  sha256 "a45ed618f498c214f3a92eadea9fc7c24c0a04a6d36d066a198f409d0ef53074"

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
