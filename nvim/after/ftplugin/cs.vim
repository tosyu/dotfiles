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
iab <buffer> prop@ public Type PropertyName { get; set; }<C-o>FT
iab <buffer> propg@ public Type PropertyName { get; }<C-o>FT
iab <buffer> iprop@ Type PropertyName { get; set; }<C-o>FT
iab <buffer> ipropg@ Type PropertyName { get; }<C-o>FT
iab <buffer> fn@ public void MethodName()<cr>{<cr><cr>}<C-c>2k0fM
iab <buffer> fnp@ private void MethodName()<cr>{<cr><cr>}<C-c>2k0fM
iab <buffer> ifn@ if (!) {<cr>}<C-c>kf)
iab <buffer> ife@ if () {<cr>} else {<cr>}<C-c>2kf)
iab <buffer> wh@ while () {<cr>}<C-c>kf)
iab <buffer> for@ for () {<cr>}<C-c>kf)
iab <buffer> fori@ for (int i = 0; i < ; i++) {<cr>}<C-c>k2f;
iab <buffer> fore@ foreach()<CR>{<CR><CR>}<C-c>2kf)
iab <buffer> try@ try<CR>{<CR><CR>}<C-o>k
iab <buffer> tryc@ try<CR>{<CR><CR>}<CR>catch (Exception exception)<CR>{<CR><CR>}<C-c>5k_
iab <buffer> tryf@ try<CR>{<CR><CR>}<CR>catch (Exception exception)<CR>{<CR><CR>}<CR>finally<CR>{<CR><CR>}<C-c>9k_
iab <buffer> tryq@ try<CR>{<CR><CR>}<CR>catch<CR>{<CR>/*mute*/<CR>}<C-c>5k_
iab <buffer> reg@ #region region name<CR><CR>#endregion<C-c>2k02w
