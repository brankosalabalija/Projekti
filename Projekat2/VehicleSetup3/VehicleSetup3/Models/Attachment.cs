//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace VehicleSetup3.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Attachment
    {
        public int ID { get; set; }
        public string FleetNo { get; set; }
        public string Name { get; set; }
        public string Extension { get; set; }
        public string Size { get; set; }
        public string Path { get; set; }
        public byte[] Image { get; set; }
        public bool IsDefaultImage { get; set; }
    
        public virtual FleetAsset FleetAsset { get; set; }
    }
}
