Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E39A78C23A
	for <lists+cluster-devel@lfdr.de>; Tue, 29 Aug 2023 12:20:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693304412;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=+Zw4JhiIBbyY7rTQH9j9//Y36dh4vyeXPMmZv+zXUD8=;
	b=acfuwzAyRVUGiI+nyHD85FD0LCIGWbU8ctDnSf/lZJ+AEB7447mMYXHn+he+EU0wiwoCoL
	HhRVFlTNTD7ThL08/SMMNOGYc7tTM+WpLR4Re31zMDM4ieywUCD9PsmgbStyiImeRdRu7t
	w4fjCiVCCSVy8gy+vsELHUgstqvE8iI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-yeYF5qChPMWyxmjULjUNyg-1; Tue, 29 Aug 2023 06:20:09 -0400
X-MC-Unique: yeYF5qChPMWyxmjULjUNyg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04D3F8D40A7;
	Tue, 29 Aug 2023 10:20:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9D8C340C2063;
	Tue, 29 Aug 2023 10:20:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 297E519465BA;
	Tue, 29 Aug 2023 10:20:06 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E4C5C19465B6 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 29 Aug 2023 10:20:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AE76A2026D68; Tue, 29 Aug 2023 10:20:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A6FD32026D4B
 for <cluster-devel@redhat.com>; Tue, 29 Aug 2023 10:20:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C09785CBE8
 for <cluster-devel@redhat.com>; Tue, 29 Aug 2023 10:20:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-DsLP30GVPGeJG-anm3ZQLg-1; Tue, 29 Aug 2023 06:20:00 -0400
X-MC-Unique: DsLP30GVPGeJG-anm3ZQLg-1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="354846736"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="354846736"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 03:19:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="732157262"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="732157262"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 29 Aug 2023 03:19:56 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qavpD-0008e7-1Y;
 Tue, 29 Aug 2023 10:19:55 +0000
Date: Tue, 29 Aug 2023 18:19:07 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <202308291833.73wBCBdr-lkp@intel.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [gfs2:for-later 27/30] kernel/kthread.c:738:
 warning: Function parameter or member 'k' not described in
 'kthread_stop_put'
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: intel.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git for-later
head:   b10d94a0cbfc4bbfdf6dcdaa966fb4f17eee08f1
commit: d3a19da72d2ef3e8f1d756b9f859a93ef84c3078 [27/30] kthread: Add kthread_stop_put
config: i386-buildonly-randconfig-001-20230829 (https://download.01.org/0day-ci/archive/20230829/202308291833.73wBCBdr-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308291833.73wBCBdr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308291833.73wBCBdr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/kthread.c:738: warning: Function parameter or member 'k' not described in 'kthread_stop_put'


vim +738 kernel/kthread.c

   721	
   722	/**
   723	 * kthread_stop_put - stop a thread and put its task struct
   724	 *
   725	 * Stops a kthread and put its task_struct.  This is meant for callers
   726	 * holding an extra reference on the task struct obtained by something
   727	 * like:
   728	 *
   729	 *   t = kthread_create(...);
   730	 *   if (!IS_ERR(t)) {
   731	 *     get_task_struct(t);
   732	 *     wake_up_process(t)
   733	 *   }
   734	 *
   735	 * Returns the result of kthread_stop().
   736	 */
   737	int kthread_stop_put(struct task_struct *k)
 > 738	{
   739		int ret;
   740	
   741		ret = kthread_stop(k);
   742		put_task_struct(k);
   743		return ret;
   744	}
   745	EXPORT_SYMBOL(kthread_stop_put);
   746	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

