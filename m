Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5C50214924B
	for <lists+cluster-devel@lfdr.de>; Sat, 25 Jan 2020 01:19:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579911540;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=K+o/rr1jsrHErsf62Lu7B+ayUMy0BINa3ylQrK6xYPo=;
	b=JYhIZwto3rpvRRMfkjiON0vJei9Ecad0rnx94lyE9nTLEF/zJy9enNT9VuLPEZKwo6uj5b
	Y8tnBia8LfxGgjDe4oQgZaMvm5dY80UxX4DnDoWMpZiu+AY3PkSO5SnAI6WDpUj7J+bkYA
	Wu10WGjnhXk5WiVdpXn+/dHySacvHok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-vC1PYld9NBmRmpAVlxEijg-1; Fri, 24 Jan 2020 19:18:58 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44999800D6C;
	Sat, 25 Jan 2020 00:18:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CEC4F8DC28;
	Sat, 25 Jan 2020 00:18:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 32ACA85965;
	Sat, 25 Jan 2020 00:18:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00P0IocI007413 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 24 Jan 2020 19:18:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B491C12113E; Sat, 25 Jan 2020 00:18:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B09EA121134
	for <cluster-devel@redhat.com>; Sat, 25 Jan 2020 00:18:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F26EA185AB84
	for <cluster-devel@redhat.com>; Sat, 25 Jan 2020 00:18:47 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-104-Y3t9ZDEOOkahme_-du16qw-1;
	Fri, 24 Jan 2020 19:18:43 -0500
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jan 2020 16:18:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,359,1574150400"; d="scan'208";a="221188105"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
	by orsmga008.jf.intel.com with ESMTP; 24 Jan 2020 16:18:40 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
	(envelope-from <lkp@intel.com>)
	id 1iv99r-0006FR-UJ; Sat, 25 Jan 2020 08:18:39 +0800
Date: Sat, 25 Jan 2020 08:17:39 +0800
From: kbuild test robot <lkp@intel.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <202001250859.Hrvdf2d0%lkp@intel.com>
MIME-Version: 1.0
User-Agent: NeoMutt/20170113 (1.7.2)
X-MC-Unique: Y3t9ZDEOOkahme_-du16qw-1
X-MC-Unique: vC1PYld9NBmRmpAVlxEijg-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00P0IocI007413
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, kbuild-all@lists.01.org
Subject: [Cluster-devel] [gfs2:gfs2-iopen 15/15] fs/gfs2/glock.c:687:6:
 sparse: sparse: symbol '__gfs2_inode_remember_delete' was not declared.
 Should it be static?
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git=
 gfs2-iopen
head:   90a0918fc357b78974088d4dc80de1448d8f135a
commit: 90a0918fc357b78974088d4dc80de1448d8f135a [15/15] DEBUG
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-153-g47b6dfef-dirty
        git checkout 90a0918fc357b78974088d4dc80de1448d8f135a
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> fs/gfs2/glock.c:687:6: sparse: sparse: symbol '__gfs2_inode_remember_del=
ete' was not declared. Should it be static?
   fs/gfs2/glock.h:172:36: sparse: sparse: context imbalance in '__gfs2_glo=
ck_put' - unexpected unlock
   arch/x86/include/asm/bitops.h:77:37: sparse: sparse: cast truncates bits=
 from constant value (ffffff7f becomes 7f)
   arch/x86/include/asm/bitops.h:77:37: sparse: sparse: cast truncates bits=
 from constant value (ffffff7f becomes 7f)
   fs/gfs2/glock.c:834:13: sparse: sparse: context imbalance in 'glock_work=
_func' - different lock contexts for basic block

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporat=
ion


