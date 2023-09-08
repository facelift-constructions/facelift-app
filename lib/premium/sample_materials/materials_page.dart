import 'package:facelift_constructions/constants.dart';
import 'package:flutter/material.dart';

class MaterialsPage extends StatefulWidget {
  const MaterialsPage({Key? key}) : super(key: key);

  @override
  State<MaterialsPage> createState() => _MaterialsPageState();
}

class _MaterialsPageState extends State<MaterialsPage> {
  @override
  Widget build(BuildContext context) {
    int ms1 = 100, ms2 = 100, ms3 = 100, ms4 = 100, ms5 = 100;
    int mu1 = 100, mu2 = 100, mu3 = 100, mu4 = 100, mu5 = 100;
    int mr1 = 100, mr2 = 100, mr3 = 100, mr4 = 100, mr5 = 100;

    int ps1 = 200,
        ps2 = 200,
        ps3 = 200,
        ps4 = 200,
        ps5 = 200,
        ps6 = 200,
        ps7 = 200;

    int pu1 = 200,
        pu2 = 200,
        pu3 = 200,
        pu4 = 200,
        pu5 = 200,
        pu6 = 200,
        pu7 = 200;

    int pr1 = 200,
        pr2 = 200,
        pr3 = 200,
        pr4 = 200,
        pr5 = 200,
        pr6 = 200,
        pr7 = 200;

    int es1 = 100, es2 = 100, es3 = 100, es4 = 100, es5 = 100, es6 = 100;
    int eu1 = 100, eu2 = 100, eu3 = 100, eu4 = 100, eu5 = 100, eu6 = 100;
    int er1 = 100, er2 = 100, er3 = 100, er4 = 100, er5 = 100, er6 = 100;

    int fs1 = 100, fs2 = 100, fs3 = 100, fs4 = 100;
    int fu1 = 100, fu2 = 100, fu3 = 100, fu4 = 100;
    int fr1 = 100, fr2 = 100, fr3 = 100, fr4 = 100;

    int cs1 = 100,
        cs2 = 100,
        cs3 = 100,
        cs4 = 100,
        cs5 = 100,
        cs6 = 100,
        cs7 = 100;
    int cu1 = 100,
        cu2 = 100,
        cu3 = 100,
        cu4 = 100,
        cu5 = 100,
        cu6 = 100,
        cu7 = 100;
    int cr1 = 100,
        cr2 = 100,
        cr3 = 100,
        cr4 = 100,
        cr5 = 100,
        cr6 = 100,
        cr7 = 100;

    int ces1 = 100, ces2 = 100, ces3 = 100;
    int ceu1 = 100, ceu2 = 100, ceu3 = 100;
    int cer1 = 100, cer2 = 100, cer3 = 100;

    int pas1 = 200,
        pas2 = 200,
        pas3 = 200,
        pas4 = 200,
        pas5 = 200,
        pas6 = 200,
        pas7 = 200;

    int pau1 = 200,
        pau2 = 200,
        pau3 = 200,
        pau4 = 200,
        pau5 = 200,
        pau6 = 200,
        pau7 = 200;

    int par1 = 200,
        par2 = 200,
        par3 = 200,
        par4 = 200,
        par5 = 200,
        par6 = 200,
        par7 = 200;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text("Materials", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black54),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  heading('Mansory'),
                  row(
                    'Brick',
                    'None',
                    ms1,
                    mu1,
                    mr1,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  row(
                    'Sand (reta)',
                    'None',
                    ms2,
                    mu2,
                    mr2,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  row(
                    'Aggregate (bajri)',
                    'None',
                    ms3,
                    mu3,
                    mr3,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  row(
                    'Cement',
                    'None',
                    ms4,
                    mu4,
                    mr4,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  row(
                    'Reinforcement (sariya)',
                    'None',
                    ms5,
                    mu5,
                    mr5,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  const SizedBox(height: 8),
                  heading('Plumbing'),
                  row(
                    'PVC pipes /GI pipes',
                    'None',
                    ps1,
                    pu1,
                    pr1,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  row(
                    'Mixer Diverter (tap)',
                    'None',
                    ps2,
                    pu2,
                    pr2,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  row(
                    'Washbasin',
                    'None',
                    ps3,
                    pu3,
                    pr3,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  row(
                    'Shower heads',
                    'None',
                    ps4,
                    pu4,
                    pr4,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  row(
                    'WC set',
                    'None',
                    ps5,
                    pu5,
                    pr5,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  row(
                    'Traps',
                    'None',
                    ps6,
                    pu6,
                    pr6,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  row(
                    'Drain cover (jali)',
                    'None',
                    ps7,
                    pu7,
                    pr7,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  const SizedBox(height: 8),
                  heading('Electrical'),
                  row(
                    'PVC Conduit Pipes & Fittings',
                    'None',
                    es1,
                    eu1,
                    er1,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  row(
                    'Casing Capping & Fittings',
                    'None',
                    es2,
                    eu2,
                    er2,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  row(
                    'Electrical Switches',
                    'None',
                    es3,
                    eu3,
                    er3,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  row(
                    'Wires & Cables',
                    'None',
                    es4,
                    eu4,
                    er4,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  row(
                    'Boxes & Enclosures',
                    'None',
                    es5,
                    eu5,
                    er5,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  row(
                    'Electrical Doorbells',
                    'None',
                    es6,
                    eu6,
                    er6,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  const SizedBox(height: 8),
                  heading('Flooring'),
                  row(
                    'Tiles/ marble',
                    'None',
                    fs1,
                    fu1,
                    fr1,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  row(
                    'Spacer',
                    'None',
                    fs2,
                    fu2,
                    fr2,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  row(
                    'Tile cement',
                    'None',
                    fs3,
                    fu3,
                    fr3,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  row(
                    'Sand',
                    'None',
                    fs4,
                    fu4,
                    fr4,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  const SizedBox(height: 8),
                  heading('Carpentry'),
                  row(
                    'Ply',
                    'None',
                    cs1,
                    cu1,
                    cr1,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  row(
                    'Laminate/veneer',
                    'None',
                    cs2,
                    cu2,
                    cr2,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  row(
                    'Fevicol',
                    'None',
                    cs3,
                    cu3,
                    cr3,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  row(
                    'Nails',
                    'None',
                    cs4,
                    cu4,
                    cr4,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  row(
                    'Handles',
                    'None',
                    cs5,
                    cu5,
                    cr5,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  row(
                    'Door/windows',
                    'None',
                    cs6,
                    cu6,
                    cr6,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  row(
                    'Door stoppers',
                    'None',
                    cs7,
                    cu7,
                    cr7,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  const SizedBox(height: 8),
                  heading('Ceiling'),
                  row(
                    'POP',
                    'None',
                    ces1,
                    ceu1,
                    cer1,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  row(
                    'Aluminium channel',
                    'None',
                    ces2,
                    ceu2,
                    cer2,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  row(
                    'Wire mesh',
                    'None',
                    ces3,
                    ceu3,
                    cer3,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  const SizedBox(height: 8),
                  heading('Painting'),
                  row(
                    'Wall putty',
                    'None',
                    pas1,
                    pau1,
                    par1,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  row(
                    'Damp proofing',
                    'None',
                    pas2,
                    pau2,
                    par2,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  row(
                    'Primer',
                    'None',
                    pas3,
                    pau3,
                    par3,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  row(
                    'Wall paint',
                    'None',
                    pas4,
                    pau4,
                    par4,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  row(
                    'Roller',
                    'None',
                    pas5,
                    pau5,
                    par5,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  row(
                    'Brushes',
                    'None',
                    pas6,
                    pau6,
                    par6,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                  row(
                    'Polishes',
                    'None',
                    pas7,
                    pau7,
                    par7,
                    progressLime,
                    pinkColor,
                    progressYellow,
                    progressGrey,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget heading(String name) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        width: size.width,
        child: Text(
          name,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Widget row(String name, remarks, int s, u, r, Color c1, c2, c3, c4) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        height: 90, //-------------------------------------------------here
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: size.width,
              child: Text(
                name,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  cell(
                    "In-Stock",
                    '$s',
                    size,
                    c1,
                  ),
                  cell(
                    "Used",
                    '$u',
                    size,
                    pinkColor,
                  ),
                  cell(
                    "Required",
                    '$r',
                    size,
                    progressYellow,
                  ),
                  cell(
                    "Remarks",
                    remarks,
                    size,
                    progressGrey,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget cell(String name, String val, Size size, Color color) {
    return Container(
      height: 70,
      width: size.width * 0.23,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(11),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 2),
          Text(
            val,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
