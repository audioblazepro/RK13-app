import 'package:flutter/material.dart';
import '../models/repo_model.dart';
import 'repo_readme_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<RepoModel> repos = [
      RepoModel(
        name: 'termux-style',
        description: 'Change your Termux font and color styles',
        scriptFile: 'style.sh',
        githubUrl: 'https://github.com/Rk13termux/termux-style',
      ),
      RepoModel(
        name: 'termux-ohmyzsh',
        description: 'ZSH plugin manager for Termux',
        scriptFile: 'ohmyzsh.sh',
        githubUrl: 'https://github.com/Rk13termux/termux-ohmyzsh',
      ),
      RepoModel(
        name: 'termux-toolkit',
        description: 'Custom toolkit for Termux automation',
        scriptFile: 'toolkit.sh',
        githubUrl: 'https://github.com/Rk13termux/termux-toolkit',
      ),
      RepoModel(
        name: 'termux-ubuntu',
        description: 'Install Ubuntu in Termux',
        scriptFile: 'ubuntu.sh',
        githubUrl: 'https://github.com/Rk13termux/termux-ubuntu',
      ),
      RepoModel(
        name: 'termux-fedora',
        description: 'Install Fedora in Termux',
        scriptFile: 'fedora.sh',
        githubUrl: 'https://github.com/Rk13termux/termux-fedora',
      ),
      RepoModel(
        name: 'termux-kali',
        description: 'Install Kali Linux in Termux',
        scriptFile: 'kali.sh',
        githubUrl: 'https://github.com/Rk13termux/termux-kali',
      ),
      RepoModel(
        name: 'termux-parrot',
        description: 'Install Parrot OS in Termux',
        scriptFile: 'parrot.sh',
        githubUrl: 'https://github.com/Rk13termux/termux-parrot',
      ),
      RepoModel(
        name: 'termux-debian',
        description: 'Install Debian in Termux',
        scriptFile: 'debian.sh',
        githubUrl: 'https://github.com/Rk13termux/termux-debian',
      ),
      RepoModel(
        name: 'termux-arch',
        description: 'Install Arch Linux in Termux',
        scriptFile: 'arch.sh',
        githubUrl: 'https://github.com/Rk13termux/termux-arch',
      ),
      RepoModel(
        name: 'termux-alpine',
        description: 'Install Alpine Linux in Termux',
        scriptFile: 'alpine.sh',
        githubUrl: 'https://github.com/Rk13termux/termux-alpine',
      ),
      RepoModel(
        name: 'termux-openbox',
        description: 'Run Openbox desktop in Termux',
        scriptFile: 'openbox.sh',
        githubUrl: 'https://github.com/Rk13termux/termux-openbox',
      ),
      RepoModel(
        name: 'termux-xfce',
        description: 'Run XFCE desktop in Termux',
        scriptFile: 'xfce.sh',
        githubUrl: 'https://github.com/Rk13termux/termux-xfce',
      ),
      RepoModel(
        name: 'termux-lxde',
        description: 'Run LXDE desktop in Termux',
        scriptFile: 'lxde.sh',
        githubUrl: 'https://github.com/Rk13termux/termux-lxde',
      ),
      RepoModel(
        name: 'termux-mate',
        description: 'Run MATE desktop in Termux',
        scriptFile: 'mate.sh',
        githubUrl: 'https://github.com/Rk13termux/termux-mate',
      ),
      RepoModel(
        name: 'termux-cinnamon',
        description: 'Run Cinnamon desktop in Termux',
        scriptFile: 'cinnamon.sh',
        githubUrl: 'https://github.com/Rk13termux/termux-cinnamon',
      ),
      RepoModel(
        name: 'termux-gnome',
        description: 'Run GNOME desktop in Termux',
        scriptFile: 'gnome.sh',
        githubUrl: 'https://github.com/Rk13termux/termux-gnome',
      ),
      RepoModel(
        name: 'termux-i3',
        description: 'Run i3 window manager in Termux',
        scriptFile: 'i3.sh',
        githubUrl: 'https://github.com/Rk13termux/termux-i3',
      ),
      RepoModel(
        name: 'termux-xmonad',
        description: 'Run Xmonad in Termux',
        scriptFile: 'xmonad.sh',
        githubUrl: 'https://github.com/Rk13termux/termux-xmonad',
      ),
      RepoModel(
        name: 'termux-bspwm',
        description: 'Run bspwm in Termux',
        scriptFile: 'bspwm.sh',
        githubUrl: 'https://github.com/Rk13termux/termux-bspwm',
      ),
      RepoModel(
        name: 'termux-herbstluftwm',
        description: 'Run herbstluftwm in Termux',
        scriptFile: 'herbstluftwm.sh',
        githubUrl: 'https://github.com/Rk13termux/termux-herbstluftwm',
      ),
      RepoModel(
        name: 'termux-xrdp',
        description: 'Setup XRDP server in Termux',
        scriptFile: 'xrdp.sh',
        githubUrl: 'https://github.com/Rk13termux/termux-xrdp',
      ),
      RepoModel(
        name: 'termux-vnc',
        description: 'Setup VNC server in Termux',
        scriptFile: 'vnc.sh',
        githubUrl: 'https://github.com/Rk13termux/termux-vnc',
      ),
      RepoModel(
        name: 'termux-setup',
        description: 'Initial setup and packages for Termux',
        scriptFile: 'setup.sh',
        githubUrl: 'https://github.com/Rk13termux/termux-setup',
      ),
      RepoModel(
        name: 'termux-proxy',
        description: 'Configure proxy in Termux',
        scriptFile: 'proxy.sh',
        githubUrl: 'https://github.com/Rk13termux/termux-proxy',
      ),
      RepoModel(
        name: 'termux-dns',
        description: 'Change DNS settings in Termux',
        scriptFile: 'dns.sh',
        githubUrl: 'https://github.com/Rk13termux/termux-dns',
      ),
      RepoModel(
        name: 'termux-firewall',
        description: 'Basic firewall rules for Termux',
        scriptFile: 'firewall.sh',
        githubUrl: 'https://github.com/Rk13termux/termux-firewall',
      ),
      RepoModel(
        name: 'termux-tools',
        description: 'Miscellaneous tools for Termux',
        scriptFile: 'tools.sh',
        githubUrl: 'https://github.com/Rk13termux/termux-tools',
      ),
      RepoModel(
        name: 'termux-benchmark',
        description: 'Benchmark tools in Termux',
        scriptFile: 'benchmark.sh',
        githubUrl: 'https://github.com/Rk13termux/termux-benchmark',
      ),
      RepoModel(
        name: 'termux-monitor',
        description: 'System monitor for Termux',
        scriptFile: 'monitor.sh',
        githubUrl: 'https://github.com/Rk13termux/termux-monitor',
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('RK13 Termux Scripts')),
      body: ListView.builder(
        itemCount: repos.length,
        itemBuilder: (context, index) {
          final repo = repos[index];
          return ListTile(
            title: Text(repo.name),
            subtitle: Text(repo.description),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => RepoReadmePage(
                  repo: repo,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
