function _guess_class_name()
	let [lnum, col] = searchpos("class", "bnz")
	let l:classline = getline(lnum)[col:]
	return split(classline, " ")[1]
endfunction

iab <buffer> cl@ public class <C-R>=expand("%:t:r")<CR><CR>{<CR><CR>}<C-o>k
iab <buffer> clp@ private class <C-R>=expand("%:t:r")<CR><CR>{<CR><CR>}<C-o>k
iab <buffer> cli@ internal class <C-R>=expand("%:t:r")<CR><CR>{<CR><CR>}<C-o>k
iab <buffer> cls@ public static class <C-R>=expand("%:t:r")<CR><CR>{<CR><CR>}<C-o>k
iab <buffer> clsp@ private static class <C-R>=expand("%:t:r")<CR><CR>{<CR><CR>}<C-o>k
iab <buffer> clsi@ internal static class <C-R>=expand("%:t:r")<CR><CR>{<CR><CR>}<C-o>k
iab <buffer> cll@ public sealed class <C-R>=expand("%:t:r")<CR><CR>{<CR><CR>}<C-o>k
iab <buffer> cllp@ private sealed class <C-R>=expand("%:t:r")<CR><CR>{<CR><CR>}<C-o>k
iab <buffer> clli@ internal sealed class <C-R>=expand("%:t:r")<CR><CR>{<CR><CR>}<C-o>k
iab <buffer> en@ public enum <C-R>=expand("%:t:r")<CR><CR>{<CR><CR>}<C-o>k
iab <buffer> enp@ private enum <C-R>=expand("%:t:r")<CR><CR>{<CR><CR>}<C-o>k
iab <buffer> eni@ internal enum <C-R>=expand("%:t:r")<CR><CR>{<CR><CR>}<C-o>k
iab <buffer> ns@ namespace <C-R>=expand("%:h:gs?[\/]?.?sub")<CR>;
iab <buffer> ifc@ public interface <C-R>=expand("%:t:r")<CR><CR>{<CR><CR>}<C-o>k
iab <buffer> ifcp@ private interface <C-R>=expand("%:t:r")<CR><CR>{<CR><CR>}<C-o>k
iab <buffer> ifci@ internal interface <C-R>=expand("%:t:r")<CR><CR>{<CR><CR>}<C-o>k
iab <buffer> ctor@ public <C-R>=_guess_class_name()<CR>()<CR>{<CR><CR>}<C-o>k
iab <buffer> ctorp@ private <C-R>=_guess_class_name()<CR>()<CR>{<CR><CR>}<C-o>k
