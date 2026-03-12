return {
	-- public class
	s("cl", fmta(
		[[
		public class <>
		{
			<>
		}
		]],
		{
			i(1, "ClassName"),
			i(2)
		}
	)),

	-- private class
	s("clp", fmta(
		[[
		private class <>
		{
			<>
		}
		]],
		{
			i(1, "ClassName"),
			i(2)
		}
	)),

	-- internal class
	s("cli", fmta(
		[[
		private class <>
		{
			<>
		}
		]],
		{
			i(1, "ClassName"),
			i(2)
		}
	)),

	-- public static class
	s("cls", fmta(
		[[
		public static class <>
		{
			<>
		}
		]],
		{
			i(1, "ClassName"),
			i(2)
		}
	)),

	-- private static class
	s("clsp", fmta(
		[[
		private static class <>
		{
			<>
		}
		]],
		{
			i(1, "ClassName"),
			i(2)
		}
	)),

	-- internal static class
	s("clsi", fmta(
		[[
		internal static class <>
		{
			<>
		}
		]],
		{
			i(1, "ClassName"),
			i(2)
		}
	)),

	-- public sealed class
	s("cll", fmta(
		[[
		public sealed class <>
		{
			<>
		}
		]],
		{
			i(1, "ClassName"),
			i(2)
		}
	)),

	-- private sealed class
	s("cllp", fmta(
		[[
		private sealed class <>
		{
			<>
		}
		]],
		{
			i(1, "ClassName"),
			i(2)
		}
	)),

	-- internal sealed class
	s("clli", fmta(
		[[
		internal sealed class <>
		{
			<>
		}
		]],
		{
			i(1, "ClassName"),
			i(2)
		}
	)),

	-- public enum
	s("enu", fmta(
		[[
		public enum <>
		{
			<>
		}
		]],
		{
			i(1, "EnumName"),
			i(2)
		}
	)),

	-- private enum
	s("enup", fmta(
		[[
		private enum <>
		{
			<>
		}
		]],
		{
			i(1, "EnumName"),
			i(2)
		}
	)),

	-- internal enum
	s("enui", fmta(
		[[
		internal enum <>
		{
			<>
		}
		]],
		{
			i(1, "EnumName"),
			i(2)
		}
	)),

	-- namespace
	s("ns", fmta(
		[[
		namespace <>;
		]],
		{i(1, "NameSpacePath")}
	)),

	-- public interface
	s("ifc", fmta(
		[[
		public interface <>
		{
			<>
		}
		]],
		{
			i(1, "IInterfaceName"),
			i(2)
		}
	)),

	-- private interface
	s("ifcp", fmta(
		[[
		private interface <>
		{
			<>
		}
		]],
		{
			i(1, "IInterfaceName"),
			i(2)
		}
	)),

	-- private interface
	s("ifci", fmta(
		[[
		internal interface <>
		{
			<>
		}
		]],
		{
			i(1, "IInterfaceName"),
			i(2)
		}
	)),

	-- constructor
	s("ctor", fmta(
		[[
		public <>
		{
			<>
		}
		]],
		{
			i(1, "ClassName"),
			i(2)
		}
	)),

	-- public property
	s("prop", fmta(
		[[
		public <> <> { get; set; }
		]],
		{
			i(1, "Type"),
			i(2, "PropertyName")
		}
	)),

	-- public readonly property
	s("propg", fmta(
		[[
		public <> <> { get; }
		]],
		{
			i(1, "Type"),
			i(2, "PropertyName")
		}
	)),

	-- public method
	s("meth", fmta(
		[[
		public <> <>(<>)
		{
			<>
		}
		]],
		{
			i(1, "ReturnType"),
			i(2, "MethodName"),
			i(3, "Arguments"),
			i(4),
		}
	)),

	-- private method
	s("methp", fmta(
		[[
		private <> <>(<>)
		{
			<>
		}
		]],
		{
			i(1, "ReturnType"),
			i(2, "MethodName"),
			i(3, "Arguments"),
			i(4),
		}
	)),

	-- while loop
	s("while", fmta(
		[[
		while(<>)
		{
			<>
		}
		]],
		{
			i(1, "true"),
			i(2)
		}
	)),

	-- for loop
	s("for", fmta(
		[[
		for(<>; <>; <>)
		{
			<>
		}
		]],
		{
			i(1, "var i = 0"),
			i(2, "i < 10"),
			i(3, "i++"),
			i(4)
		}
	)),

	-- foreach loop
	s("fore", fmta(
		[[
		foreach(var <> in <>)
		{
			<>
		}
		]],
		{
			i(1, "variable"),
			i(2, "collection"),
			i(2)
		}
	)),

	-- try-catch
	s("try", fmta(
		[[
		try
		{

		}
		catch(<> <>)
		{
			<>
		}
		]],
		{
			i(1, "Exception"),
			i(2, "exception"),
			i(3, "Console.Error(exception);")
		}
	)),

	-- try-catch-finally
	s("tryf", fmta(
		[[
		try
		{

		}
		catch(<> <>)
		{
			<>
		}
		finally
		{

		}
		]],
		{
			i(1, "Exception"),
			i(2, "exception"),
			i(3, "Console.Error(exception);")
		}
	)),

	-- mute exception in try
	s("tryq", fmta(
		[[
		try
		{
			<>
		}
		catch {
			// mute
		}
		]],
		{
			i(1)
		}
	)),

	-- #region
	s("#reg", fmta(
		[[
		#region <>

		#endregion
		]],
		{
			i(1, "RegionName")
		}
	)),

	-- cast
	s("cast", fmta(
		[[
		((<>) <>)
		]],
		{
			i(1, "Type"),
			i(2, "variable")
		}
	)),

	-- empty array
	s("ear", fmta(
		[[
		<>[] <> = [];
		]],
		{
			i(1, "Type"),
			i(2, "variableName")
		}
	)),

}
