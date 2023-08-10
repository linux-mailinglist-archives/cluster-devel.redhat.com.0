Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B67776D63
	for <lists+cluster-devel@lfdr.de>; Thu, 10 Aug 2023 03:12:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691629937;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=R4AVdgW+vpLGvSDglGS8RXThyHftWhRixu5MXZ9M3rw=;
	b=RpiwkTpvJAHpcoXWfo1/HcwsZuFhmN6NUxuGYaLpI3nrGgyioqpzhS+X+2VMFP2sZwLYda
	Hx7XUypLGABRaBy+R/9/+Q3wMFU8pyFdAfRgty/ln2ome3E35PPoupNwnq6FLVxvfIBrLV
	3XK9pLhiqSo1PJiCSIUmKsIRMoNF4Hw=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-aeHiwAHXMdybTf30qSfhmA-1; Wed, 09 Aug 2023 21:12:14 -0400
X-MC-Unique: aeHiwAHXMdybTf30qSfhmA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3CC7D380407E;
	Thu, 10 Aug 2023 01:12:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 46ABE492C13;
	Thu, 10 Aug 2023 01:12:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9BE621946594;
	Thu, 10 Aug 2023 01:12:09 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 614BC1946588 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 10 Aug 2023 01:12:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 36AD02166B27; Thu, 10 Aug 2023 01:12:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B81C2166B25
 for <cluster-devel@redhat.com>; Thu, 10 Aug 2023 01:12:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B848185A791
 for <cluster-devel@redhat.com>; Thu, 10 Aug 2023 01:12:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-Yla3auDrNe-D00Dkb6T_yg-1; Wed, 09 Aug 2023 21:11:58 -0400
X-MC-Unique: Yla3auDrNe-D00Dkb6T_yg-1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="361401550"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="361401550"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 18:10:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="797414540"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="797414540"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 09 Aug 2023 18:10:51 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qTuCQ-0006Yi-2f;
 Thu, 10 Aug 2023 01:10:50 +0000
Date: Thu, 10 Aug 2023 09:09:54 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <202308100902.W9OB1FfN-lkp@intel.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [gfs2:for-next 7/8] fs/gfs2/glock.c:1525:1:
 warning: unused label 'do_cancel'
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: cluster-devel@redhat.com, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: intel.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git for-next
head:   2a3fda9c1ecf6acd1dbe4bec7b66b4a0503f1586
commit: 226c6235cc2a4ea43e6a73cd8154dc88a3674a84 [7/8] gfs2: Remove LM_FLAG_PRIORITY flag
config: hexagon-randconfig-r041-20230809 (https://download.01.org/0day-ci/archive/20230810/202308100902.W9OB1FfN-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100902.W9OB1FfN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308100902.W9OB1FfN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/gfs2/glock.c:12:
   In file included from include/linux/buffer_head.h:12:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from fs/gfs2/glock.c:12:
   In file included from include/linux/buffer_head.h:12:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/gfs2/glock.c:12:
   In file included from include/linux/buffer_head.h:12:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> fs/gfs2/glock.c:1525:1: warning: unused label 'do_cancel' [-Wunused-label]
    1525 | do_cancel:
         | ^~~~~~~~~~
    1526 |         gh = list_first_entry(&gl->gl_holders, struct gfs2_holder, gh_list);
   7 warnings generated.


vim +/do_cancel +1525 fs/gfs2/glock.c

cbe6d2576e2cf7 Andreas Gruenbacher 2022-04-05  1461  
b3b94faa5fe596 David Teigland      2006-01-16  1462  /**
b3b94faa5fe596 David Teigland      2006-01-16  1463   * add_to_queue - Add a holder to the wait queue (but look for recursion)
b3b94faa5fe596 David Teigland      2006-01-16  1464   * @gh: the holder structure to add
b3b94faa5fe596 David Teigland      2006-01-16  1465   *
6802e3400ff454 Steven Whitehouse   2008-05-21  1466   * Eventually we should move the recursive locking trap to a
6802e3400ff454 Steven Whitehouse   2008-05-21  1467   * debugging option or something like that. This is the fast
6802e3400ff454 Steven Whitehouse   2008-05-21  1468   * path and needs to have the minimum number of distractions.
6802e3400ff454 Steven Whitehouse   2008-05-21  1469   * 
b3b94faa5fe596 David Teigland      2006-01-16  1470   */
b3b94faa5fe596 David Teigland      2006-01-16  1471  
6802e3400ff454 Steven Whitehouse   2008-05-21  1472  static inline void add_to_queue(struct gfs2_holder *gh)
f3dd1649122b9e Andreas Gruenbacher 2015-10-29  1473  __releases(&gl->gl_lockref.lock)
f3dd1649122b9e Andreas Gruenbacher 2015-10-29  1474  __acquires(&gl->gl_lockref.lock)
b3b94faa5fe596 David Teigland      2006-01-16  1475  {
b3b94faa5fe596 David Teigland      2006-01-16  1476  	struct gfs2_glock *gl = gh->gh_gl;
15562c439d0a18 Bob Peterson        2015-03-16  1477  	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
6802e3400ff454 Steven Whitehouse   2008-05-21  1478  	struct list_head *insert_pt = NULL;
6802e3400ff454 Steven Whitehouse   2008-05-21  1479  	struct gfs2_holder *gh2;
e5dc76b9afcfb9 Bob Peterson        2012-08-09  1480  	int try_futile = 0;
b3b94faa5fe596 David Teigland      2006-01-16  1481  
ad26967b9afa7f Bob Peterson        2019-08-30  1482  	GLOCK_BUG_ON(gl, gh->gh_owner_pid == NULL);
fee852e374fb36 Steven Whitehouse   2007-01-17  1483  	if (test_and_set_bit(HIF_WAIT, &gh->gh_iflags))
ad26967b9afa7f Bob Peterson        2019-08-30  1484  		GLOCK_BUG_ON(gl, true);
190562bd84a484 Steven Whitehouse   2006-04-20  1485  
6802e3400ff454 Steven Whitehouse   2008-05-21  1486  	if (gh->gh_flags & (LM_FLAG_TRY | LM_FLAG_TRY_1CB)) {
6144464937fe1e Andreas Gruenbacher 2021-08-10  1487  		if (test_bit(GLF_LOCK, &gl->gl_flags)) {
8f0028fc60a42a Andreas Gruenbacher 2022-06-11  1488  			struct gfs2_holder *current_gh;
6144464937fe1e Andreas Gruenbacher 2021-08-10  1489  
ba3e77a4a22af0 Andreas Gruenbacher 2022-12-09  1490  			current_gh = find_first_holder(gl);
8f0028fc60a42a Andreas Gruenbacher 2022-06-11  1491  			try_futile = !may_grant(gl, current_gh, gh);
6144464937fe1e Andreas Gruenbacher 2021-08-10  1492  		}
6802e3400ff454 Steven Whitehouse   2008-05-21  1493  		if (test_bit(GLF_INVALIDATE_IN_PROGRESS, &gl->gl_flags))
6802e3400ff454 Steven Whitehouse   2008-05-21  1494  			goto fail;
b3b94faa5fe596 David Teigland      2006-01-16  1495  	}
b3b94faa5fe596 David Teigland      2006-01-16  1496  
6802e3400ff454 Steven Whitehouse   2008-05-21  1497  	list_for_each_entry(gh2, &gl->gl_holders, gh_list) {
cbe6d2576e2cf7 Andreas Gruenbacher 2022-04-05  1498  		if (likely(gh2->gh_owner_pid != gh->gh_owner_pid))
cbe6d2576e2cf7 Andreas Gruenbacher 2022-04-05  1499  			continue;
cbe6d2576e2cf7 Andreas Gruenbacher 2022-04-05  1500  		if (gh->gh_gl->gl_ops->go_type == LM_TYPE_FLOCK)
cbe6d2576e2cf7 Andreas Gruenbacher 2022-04-05  1501  			continue;
cbe6d2576e2cf7 Andreas Gruenbacher 2022-04-05  1502  		if (!pid_is_meaningful(gh2))
cbe6d2576e2cf7 Andreas Gruenbacher 2022-04-05  1503  			continue;
6802e3400ff454 Steven Whitehouse   2008-05-21  1504  		goto trap_recursive;
cbe6d2576e2cf7 Andreas Gruenbacher 2022-04-05  1505  	}
cbe6d2576e2cf7 Andreas Gruenbacher 2022-04-05  1506  	list_for_each_entry(gh2, &gl->gl_holders, gh_list) {
e5dc76b9afcfb9 Bob Peterson        2012-08-09  1507  		if (try_futile &&
e5dc76b9afcfb9 Bob Peterson        2012-08-09  1508  		    !(gh2->gh_flags & (LM_FLAG_TRY | LM_FLAG_TRY_1CB))) {
6802e3400ff454 Steven Whitehouse   2008-05-21  1509  fail:
6802e3400ff454 Steven Whitehouse   2008-05-21  1510  			gh->gh_error = GLR_TRYFAILED;
6802e3400ff454 Steven Whitehouse   2008-05-21  1511  			gfs2_holder_wake(gh);
6802e3400ff454 Steven Whitehouse   2008-05-21  1512  			return;
6802e3400ff454 Steven Whitehouse   2008-05-21  1513  		}
6802e3400ff454 Steven Whitehouse   2008-05-21  1514  		if (test_bit(HIF_HOLDER, &gh2->gh_iflags))
6802e3400ff454 Steven Whitehouse   2008-05-21  1515  			continue;
6802e3400ff454 Steven Whitehouse   2008-05-21  1516  	}
edae38a6431276 Steven Whitehouse   2011-01-31  1517  	trace_gfs2_glock_queue(gh, 1);
a245769f254bbb Steven Whitehouse   2012-01-20  1518  	gfs2_glstats_inc(gl, GFS2_LKS_QCOUNT);
a245769f254bbb Steven Whitehouse   2012-01-20  1519  	gfs2_sbstats_inc(gl, GFS2_LKS_QCOUNT);
6802e3400ff454 Steven Whitehouse   2008-05-21  1520  	if (likely(insert_pt == NULL)) {
6802e3400ff454 Steven Whitehouse   2008-05-21  1521  		list_add_tail(&gh->gh_list, &gl->gl_holders);
6802e3400ff454 Steven Whitehouse   2008-05-21  1522  		return;
b3b94faa5fe596 David Teigland      2006-01-16  1523  	}
6802e3400ff454 Steven Whitehouse   2008-05-21  1524  	list_add_tail(&gh->gh_list, insert_pt);
6802e3400ff454 Steven Whitehouse   2008-05-21 @1525  do_cancel:
969183bc68bc27 Andreas Gruenbacher 2020-02-03  1526  	gh = list_first_entry(&gl->gl_holders, struct gfs2_holder, gh_list);
f3dd1649122b9e Andreas Gruenbacher 2015-10-29  1527  	spin_unlock(&gl->gl_lockref.lock);
048bca22373936 Steven Whitehouse   2008-05-23  1528  	if (sdp->sd_lockstruct.ls_ops->lm_cancel)
f057f6cdf64175 Steven Whitehouse   2009-01-12  1529  		sdp->sd_lockstruct.ls_ops->lm_cancel(gl);
f3dd1649122b9e Andreas Gruenbacher 2015-10-29  1530  	spin_lock(&gl->gl_lockref.lock);
6802e3400ff454 Steven Whitehouse   2008-05-21  1531  	return;
b3b94faa5fe596 David Teigland      2006-01-16  1532  
6802e3400ff454 Steven Whitehouse   2008-05-21  1533  trap_recursive:
e54c78a27fcdef Bob Peterson        2018-10-03  1534  	fs_err(sdp, "original: %pSR\n", (void *)gh2->gh_ip);
e54c78a27fcdef Bob Peterson        2018-10-03  1535  	fs_err(sdp, "pid: %d\n", pid_nr(gh2->gh_owner_pid));
e54c78a27fcdef Bob Peterson        2018-10-03  1536  	fs_err(sdp, "lock type: %d req lock state : %d\n",
6802e3400ff454 Steven Whitehouse   2008-05-21  1537  	       gh2->gh_gl->gl_name.ln_type, gh2->gh_state);
e54c78a27fcdef Bob Peterson        2018-10-03  1538  	fs_err(sdp, "new: %pSR\n", (void *)gh->gh_ip);
e54c78a27fcdef Bob Peterson        2018-10-03  1539  	fs_err(sdp, "pid: %d\n", pid_nr(gh->gh_owner_pid));
e54c78a27fcdef Bob Peterson        2018-10-03  1540  	fs_err(sdp, "lock type: %d req lock state : %d\n",
6802e3400ff454 Steven Whitehouse   2008-05-21  1541  	       gh->gh_gl->gl_name.ln_type, gh->gh_state);
3792ce973f07a2 Bob Peterson        2019-05-09  1542  	gfs2_dump_glock(NULL, gl, true);
6802e3400ff454 Steven Whitehouse   2008-05-21  1543  	BUG();
b3b94faa5fe596 David Teigland      2006-01-16  1544  }
b3b94faa5fe596 David Teigland      2006-01-16  1545  

:::::: The code at line 1525 was first introduced by commit
:::::: 6802e3400ff4549525930ee744030c36fce9cc73 [GFS2] Clean up the glock core

:::::: TO: Steven Whitehouse <swhiteho@redhat.com>
:::::: CC: Steven Whitehouse <swhiteho@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

