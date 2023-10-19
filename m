Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0D37CEF16
	for <lists+cluster-devel@lfdr.de>; Thu, 19 Oct 2023 07:36:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697693813;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=R7u2UjmRDNm343amMJG/FrPI4tGf9Ke9s/6+Rpu37e8=;
	b=gqDEhJNF4di9trhhEapdfUZvWqazhWr7EGXev7bbsFqos3KNN0tZtsAwwuFMKD/PPLdJup
	eE8J82FYYYuV+P81Ahc0iCC8Nww6gQI/TjjJP3ftvqqNn8vnjsXzJbfnw4lgUD6MLB30KU
	yjnPBkglUeAgVWHV19lRmpE12yE9Sj4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-376-5OB9SwhjMcS1lB78qwru_w-1; Thu, 19 Oct 2023 01:36:49 -0400
X-MC-Unique: 5OB9SwhjMcS1lB78qwru_w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BEC15881F01;
	Thu, 19 Oct 2023 05:36:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 36F57492BFA;
	Thu, 19 Oct 2023 05:36:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CF7981946A46;
	Thu, 19 Oct 2023 05:36:46 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A853E19466F6 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 19 Oct 2023 05:28:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6927D2026D66; Thu, 19 Oct 2023 05:28:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 616F22026D4C
 for <cluster-devel@redhat.com>; Thu, 19 Oct 2023 05:28:59 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3AFE410201E3
 for <cluster-devel@redhat.com>; Thu, 19 Oct 2023 05:28:59 +0000 (UTC)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-kyrOI0AxNiWFkuJanyEW5Q-1; Thu, 19 Oct 2023 01:28:54 -0400
X-MC-Unique: kyrOI0AxNiWFkuJanyEW5Q-1
X-IronPort-AV: E=Sophos;i="6.03,236,1694728800"; d="scan'208";a="132009292"
Received: from unknown (HELO hadrien) ([87.129.180.234])
 by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 07:27:50 +0200
Date: Thu, 19 Oct 2023 07:27:49 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <a8791f89-ed7b-1649-3b53-72349899c5d@inria.fr>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Subject: [Cluster-devel] [gfs2:extents 14/14] fs/gfs2/extents.c:123:23-27:
 WARNING use flexible-array member instead
 (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
 (fwd)
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
Cc: cluster-devel@redhat.com, oe-kbuild-all@lists.linux.dev
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: inria.fr
Content-Type: text/plain; charset=US-ASCII



---------- Forwarded message ----------
Date: Thu, 19 Oct 2023 05:56:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [gfs2:extents 14/14] fs/gfs2/extents.c:123:23-27: WARNING use
    flexible-array member instead
    (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-
    and-one-element-arrays)

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: cluster-devel@redhat.com
TO: Andreas Gruenbacher <agruenba@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git extents
head:   86474c69cac46872bd311318c02fb8e9e25abd10
commit: 86474c69cac46872bd311318c02fb8e9e25abd10 [14/14] gfs2: Add some initial extents-based inode code
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: x86_64-randconfig-101-20231018 (https://download.01.org/0day-ci/archive/20231019/202310190541.0impmnL4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231019/202310190541.0impmnL4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202310190541.0impmnL4-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/gfs2/extents.c:123:23-27: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

vim +123 fs/gfs2/extents.c

86474c69cac468 Andreas Gruenbacher 2021-03-25  115
86474c69cac468 Andreas Gruenbacher 2021-03-25  116  /*
86474c69cac468 Andreas Gruenbacher 2021-03-25  117   * The path components in struct gfs2_extent_path are stored in "reverse"
86474c69cac468 Andreas Gruenbacher 2021-03-25  118   * order: the leaf is stored first, and when the tree grows at the root,
86474c69cac468 Andreas Gruenbacher 2021-03-25  119   * this happens at the end of the array.
86474c69cac468 Andreas Gruenbacher 2021-03-25  120   */
86474c69cac468 Andreas Gruenbacher 2021-03-25  121  struct gfs2_extent_path {
86474c69cac468 Andreas Gruenbacher 2021-03-25  122  	unsigned int p_height;
86474c69cac468 Andreas Gruenbacher 2021-03-25 @123  	struct gfs2_extent_pc p_pc[1];
86474c69cac468 Andreas Gruenbacher 2021-03-25  124  };
86474c69cac468 Andreas Gruenbacher 2021-03-25  125

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

