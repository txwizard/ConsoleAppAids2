/*
	============================================================================
    File Name:          AssemblyInfo.cs
  
    Synopsis:           This AssemblyInfo file belongs to Visual Studio project
                        EOJTEST, which is part of solution ConsoleAppAids2.
  
    Remarks:            I don't usually include revision histories in my
                        AssemblyInfo files. This is an exception, because the
                        version update is to account for a change that affects
                        only the related C Sharp project file. Hence, I won't
                        routinely update this history.
  
    ----------------------------------------------------------------------------
    Revision History
    ----------------------------------------------------------------------------
  
    Date       Version By  Synopsis
    ---------- ------- --- -----------------------------------------------------
    2014/05/20 4.1     DAG Promote version number from 3.0 to 4.1. The only 
                           change is a new reference, WizardWrx.DLLServices. 
                           This change is confined to EOJTEST.csproj, which
                           keeps the reference list.

    2014/06/06 5.0     DAG Promote version number from 4.2 to 5.0, This 
                           promotion is part of a major reorganization of the
                           WizardWrx namespace.

    2014/12/15 5.4     DAG Swap the order of the calls to the WaitForCarbonUnit
                           and DisplayEOJMessage methods, so that the end-of-job
                           message s displayed before the carbon unit prompt.

                           The changes in this module are entirely cosmetic, as
                           the changes made in the test subject are internal.
                           Hence, the testing protocol is unchanged.

	2016/05/20 6.1     DAG Synchronize this version number with that of its 
                           dependent library, WizardWrx.DllServices2.dll.

	2016/06/09 6.3     DAG Keep the version numbers of DllServices2 and this
                           library in sync; this upgrade also covers technical
                           clarifications in the internal documentation.
    ============================================================================
*/

using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

// General Information about an assembly is controlled through the following
// set of attributes. Change these attribute values to modify the information
// associated with an assembly.
[assembly: AssemblyTitle ( "EOJTEST" )]
[assembly: AssemblyDescription ( "Test Stand for NormalExit Method" )]
[assembly: AssemblyConfiguration ( "" )]
[assembly: AssemblyCompany ( "WizardWrx" )]
[assembly: AssemblyProduct ( "WizardWrx .NET Utility Libraries" )]
[assembly: AssemblyCopyright ( "Copyright © 2012-2016, David A. Gray" )]
[assembly: AssemblyTrademark ( "This library is distributed under a three-clause BSD license." )]
[assembly: AssemblyCulture ( "" )]

// Setting ComVisible to false makes the types in this assembly not visible
// to COM components.  If you need to access a type in this assembly from
// COM, set the ComVisible attribute to true on that type.
[assembly: ComVisible ( false )]

// The following GUID is for the ID of the typelib if this project is exposed to COM
[assembly: Guid ( "720dc6dd-46eb-46d4-8dc3-9aeea4e78c41" )]

// Version information for an assembly consists of the following four values:
//
//      Major Version
//      Minor Version
//      Build Number
//      Revision
//
// You can specify all the values or you can default the Build and Revision Numbers
// by using the '*' as shown below:
// [assembly: AssemblyVersion("1.0.*")]
[assembly: AssemblyVersion ( "6.3.464.*" )]