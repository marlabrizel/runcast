function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 3,
    center: {lat: 0, lng: -180},
    mapTypeId: google.maps.MapTypeId.TERRAIN
  });

  var decodedSets = google.maps.geometry.encoding.decodePath("cehqFfh`aSfBq@HM\\Yr@iAPg@K_@AWe@uAKg@CHUk@QcBw@{B@o@Ni@Be@?m@Em@Bk@?YTe@`@]Ou@Cq@[}@Em@ScA@c@Hm@No@Bo@VyAFq@DiADA@aAGIHMF?DBl@mArAeBf@EXI?@\\]Xa@^Yd@IhAK~@q@|AqAbBgAv@aAVc@Zc@~AwAx@}@d@uA\\UJk@AI@m@Eo@NMd@F`Al@lAhB~@v@`@A\\Wb@ML?VRt@B\\G\\Zb@Dd@Gb@S^]`@WxBwB\\[Z_@lAoBX[|@a@\\]|@s@r@gAbAsBf@sARcBZ]D?`@YVc@^Ob@Bb@IvA}A^[Nk@\\mCTk@No@Bq@?q@Qi@Is@ZYb@QX]XIZ_@Nm@Bc@ImCMo@Jg@Za@Rk@^}ABk@i@sA_@Mc@@MGOO]gACQ@e@KWIm@EwC]Y{@{@Km@J_BKo@Uc@[c@{@{@u@gA[Ye@@mANKYYiBOi@_@]Wg@a@Ug@CmB\\k@f@Mb@GFCLMHUVOVICM_A]kAUe@K_@O_@NOd@?^Y~@uBDm@Lo@MSUe@O_Ak@qAMm@[]}@w@WM?CeALa@Qa@Wq@kAg@cCC_B[_@c@@c@C@mAE}BM{ADWTi@Fs@?q@m@}@u@d@mAPa@Y[a@Aq@Mi@_Aq@[_@c@Qe@yAIs@]a@{@{@a@SoAaAa@Ec@Na@Xc@P_@f@Md@Cb@XdADZBRCH`@tC@PMVCCg@?e@KYe@m@iA[]a@Sc@Q]]a@CIFJb@LjAVb@DHAF\\\\L^F^B`BHzAAn@\\jB@?p@`CZ~ADn@?xACtEGn@i@~@CPBLCDHj@F`@Rx@Ap@Mh@Qj@Yb@i@b@GJER?p@@j@N|ABp@Ab@Sx@m@n@On@MfC@TIn@Qj@Wb@ONo@lAQVa@Pc@H_@Ec@I_@SOq@E_@F_BM_BEYKTKl@Gl@Cp@AHU^c@Re@EWRA`ABR?p@I|BKj@KNCGPi@L}A@o@EmB@QX[p@DRMVc@Dm@T}ALe@Pb@JnA?v@Gx@@JH^Tn@h@Rb@Bf@K\\Wl@oAp@iARi@Fq@F_BDm@Jk@Ve@Za@Nm@Do@Am@Q_BAm@Bq@t@cAVe@^wA?o@Oi@Io@G_ATk@PUHq@DuCDm@GsCKo@_@yAm@iBEYF@Sk@CUEaA@m@Eq@@wAOo@aA_BU}ACa@d@B`An@b@N^Vn@nAZb@n@VNEXJBMAMQ}AGS?SM}@[yAGIFm@Pk@l@m@`Am@d@Id@P^\\b@X|ArAZb@X`@EZ\\`Ax@r@hArATh@Hn@\\Z`@RhA_@^_@z@bAHl@Gn@Wl@Id@DNNtACzAELHj@Gd@@Bp@ETFHHTh@Ap@Hj@Pl@Lj@h@pA|@r@tAEfA~@\\\\|@zBJl@n@`Bg@pBaApBc@Ba@CANTb@p@jBLj@Dj@LKr@mAPm@^Sd@Cb@Kd@Cd@@b@Lt@~@\\\\ZvAL~@vASb@JXb@rAbBZ\\r@dAHp@Gn@An@Lh@zA|ADlCVnAGN@NLj@Td@b@Pd@DZ`@Vf@Nh@@FKb@[~@Kf@Wd@[`@?D?JBFEHLh@L`BAr@Il@Uj@a@Zc@HY^[BKJAJf@nA?|@Gl@Mj@Sd@q@|DW`@}AvA_@TiABYb@_@\\_@VGPCn@Mv@oBbEy@bAcAp@[^a@Na@VeBfC{@z@Y`@_@ZOFQR{@r@_@Xa@Pa@D_@C]SIKODg@Fc@MUQKJe@J]Va@IYWAGs@cAw@}@[Uk@Ua@@B\\An@Fn@ITa@Vi@`AMh@]Z]\\QLMPy@x@i@x@GDy@z@eAp@qCxBa@Rc@Jy@N_@P_@V]`@_@Ve@HSFQXu@~@q@dAWLJZBn@E`Ba@jCEp@Sj@Kp@Dn@Ll@Jp@Vf@Dp@Rd@?NSNY`@En@FdBEp@Gl@Ol@d@rALl@Fp@Jn@Nj@d@lAZjABb@O\\u@`AWb@]Zg@T")

  var activityCoordinates = decodedSets;

  var activity = new google.maps.Polyline({
    path: activityCoordinates,
    geodesic: true,
    strokeColor: '#FF0000',
    strokeOpacity: 1.0,
    strokeWeight: 2
  });

  activity.setMap(map);
}
