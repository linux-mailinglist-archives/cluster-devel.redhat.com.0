Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 771163C68CF
	for <lists+cluster-devel@lfdr.de>; Tue, 13 Jul 2021 05:06:41 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-S7GRJJkAP_-OGLSt7evyBQ-1; Mon, 12 Jul 2021 23:06:38 -0400
X-MC-Unique: S7GRJJkAP_-OGLSt7evyBQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDE381084F53;
	Tue, 13 Jul 2021 03:06:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8AE060C9F;
	Tue, 13 Jul 2021 03:06:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0514B4EA2A;
	Tue, 13 Jul 2021 03:06:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16D36RIg003421 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 12 Jul 2021 23:06:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 03AA7BDC57; Tue, 13 Jul 2021 03:06:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F25DEB3016
	for <cluster-devel@redhat.com>; Tue, 13 Jul 2021 03:06:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 470311078464
	for <cluster-devel@redhat.com>; Tue, 13 Jul 2021 03:06:23 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-320-rw3-BUR5OyePWQnkHIMv1w-1; Mon, 12 Jul 2021 23:06:20 -0400
X-MC-Unique: rw3-BUR5OyePWQnkHIMv1w-1
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="210131352"
X-IronPort-AV: E=Sophos;i="5.84,235,1620716400"; 
	d="gz'50?scan'50,208,50";a="210131352"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	12 Jul 2021 20:05:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,235,1620716400"; 
	d="gz'50?scan'50,208,50";a="653611379"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
	by fmsmga005.fm.intel.com with ESMTP; 12 Jul 2021 20:05:13 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1m38jQ-000HSB-Gk; Tue, 13 Jul 2021 03:05:12 +0000
Date: Tue, 13 Jul 2021 11:04:28 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <202107131124.6noQoqDy-lkp@intel.com>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [gfs2:for-next.mmap-fault 1/5] iov_iter.c:undefined
 reference to `fault_in_user_pages'
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="0OAP2g/MAC+5xKAE"
Content-Disposition: inline

--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git for-next.mmap-fault
head:   caf380f33115de28cbd1d497390d346bedac8238
commit: 4423c35bf0a030f43fb8623a55418b727606c842 [1/5] iov_iter: Introduce fault_in_iov_iter helper
config: riscv-nommu_k210_defconfig (attached as .config)
compiler: riscv64-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git/commit/?id=4423c35bf0a030f43fb8623a55418b727606c842
        git remote add gfs2 https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
        git fetch --no-tags gfs2 for-next.mmap-fault
        git checkout 4423c35bf0a030f43fb8623a55418b727606c842
        # save the attached .config to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   riscv64-linux-ld: lib/iov_iter.o: in function `.L152':
>> iov_iter.c:(.text+0x7a4): undefined reference to `fault_in_user_pages'

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--0OAP2g/MAC+5xKAE
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
DlgtZxx8RE62zg5s2VzR5PF/WGrfBOt/AAA=
--0OAP2g/MAC+5xKAE--

