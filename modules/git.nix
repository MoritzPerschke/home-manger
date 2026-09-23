{
	programs.git = {
		enable = true;

		settings = {
			user = {
				name = "Moritz Perschke";
				email = "perschkemoritz@gmail.com";
			};
			color.ui = "auto";

			pull.rebase = false;

			merge.tool = "nvimdiff";

			mergetool = {
				prompt = false;

				"nvimdiff" = {
				keepBackup = false;
				};
			};

			diff.tool = "nvimdiff";

			difftool = {
				prompt = false;

				"nvimdiff" = {
				cmd = ''nvim -n -d "$LOCAL" "$REMOTE"'';
				};
			};
		};

		ignores = [
			"*.swp"
			"*.swo"
			"*~"

			# Python
			"__pycache__/"
			"*.py[cod]"
			"*.pyo"
			".Python"
			".pytest_cache/"
			".mypy_cache/"
			".ruff_cache/"
			".hypothesis/"
			".coverage"
			"coverage.xml"
			"htmlcov/"
			".tox/"
			".nox/"
			".venv/"
			"venv/"
			"env/"
			"ENV/"
			"*.egg-info/"
			"dist/"
			"build/"
			".eggs/"

			# LaTeX
			"*.aux"
			"*.bbl"
			"*.bcf"
			"*.blg"
			"*.fdb_latexmk"
			"*.fls"
			"*.lof"
			"*.log"
			"*.lot"
			"*.out"
			"*.run.xml"
			"*.synctex"
			"*.synctex.gz"
			"*.toc"
			"*.nav"
			"*.snm"
			"*.vrb"

			# Rust
			"target/"

			# C / C++
			"CMakeFiles/"
			"CMakeCache.txt"
			"cmake-build-*/"
			"*.o"
			"*.obj"
			"*.a"
			"*.lib"
			"*.so"
			"*.dylib"
			"*.dll"
			"*.exe"
			"*.out"
			"*.d"

			# Nix
			"result"
			"result-*"
		];
	};
}
