using System;

namespace SupportTraining
{
	class Program
	{
		static void Main(string[] args)
		{
			for (int i = 1; i <= 100; i++) {
				if (i % 3 == 0 && i % 5 == 0)
				{
					Console.WriteLine("SupportTraining");
				}
				else if (i % 3 == 0)
				{
					Console.WriteLine("Support");
				}
				else if (i % 5 == 0)
				{
					Console.WriteLine("Training");
				}
				else
				{
					Console.WriteLine(i);
				}
			}
		}
	}
}
