class CleverTools < Formula
  desc "Command Line Interface for Clever Cloud."
  homepage "https://github.com/CleverCloud/clever-tools"
  url "https://clever-tools.cellar.services.clever-cloud.com/releases/1.0.0-beta.26/clever-tools-1.0.0-beta.26_macos.tar.gz"
  version "1.0.0-beta.26"
  sha256 "431940bd24e764a8269c56dd630e46d15420fd67e624a4f6c8d4306f0d18f9e6"

  depends_on "bash-completion" => :recommended
  depends_on "zsh-completions" => :recommended

  def install
    bin.install "clever-tools-1.0.0-beta.26_macos/clever"
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
