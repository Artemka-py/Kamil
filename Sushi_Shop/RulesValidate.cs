using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sushi_Shop
{
    class RulesValidate
    {
        //soiskatel
        [Range(1, Int32.MaxValue)]
        public int ID_Soiskatel { get; set; }
        [Required]
        [StringLength(40, MinimumLength = 1)]
        public string Familia_Soiskatel { get; set; }
        [Required]
        [StringLength(40, MinimumLength = 1)]
        public string Name_Soiskatel { get; set; }
        [Required]
        [StringLength(40, MinimumLength = 1)]
        public string Otchestvo_Soiskatel { get; set; }
        [Required]
        [StringLength(4, MinimumLength = 4)]
        public string Seria_Document { get; set; }
        [Required]
        [StringLength(6, MinimumLength = 6)]
        public string Nomer_Document { get; set; }
        [Required]
        [RegularExpression(@"^\d{2}\.\d{2}\.\d{4}")]
        public string Data_Rojdrnia { get; set; }

        //otdel
        [Range(1, Int32.MaxValue)]
        public int ID_Otdel { get; set; }
        [Required]
        [StringLength(40, MinimumLength = 1)]
        public string Name_Otdel { get; set; }

        //Dolgnost
        [Range(1, Int32.MaxValue)]
        public int ID_Dolgnost { get; set; }
        public string Name_Dolgnost { get; set; }

        public decimal Oklad_of_Dolgnost { get; set; }
        [Required]
        [Range(1, Int32.MaxValue)]
        public int ID_Otdel_D { get; set; }
    }
}
