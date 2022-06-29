Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A206255F286
	for <lists+cluster-devel@lfdr.de>; Wed, 29 Jun 2022 02:51:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656463915;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=08BlnmthobijJ8dmREPVxYtPLmbFsVvvK4HxSWBuhyM=;
	b=V6czaDPBYxgoctt/lkSD/joYWLnwQysCiOme96/oIp2WATWUcwoQB++IncpSGA2lBpOcCT
	YDIdMDmoW8ov7Ert1Xafe0wv+3pdQj6ug0rBvjW3oj1dT4lmMvm/jBgfmE7Ftzfzwa3CFW
	CRjNjYF8/54+p8fGm56NrkekPJOomKs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-CphHwovKPIyHZmIaQX1G_g-1; Tue, 28 Jun 2022 20:51:52 -0400
X-MC-Unique: CphHwovKPIyHZmIaQX1G_g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B41793C0F383;
	Wed, 29 Jun 2022 00:51:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B38BD112131B;
	Wed, 29 Jun 2022 00:51:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 813D71947058;
	Wed, 29 Jun 2022 00:51:50 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9C09A1947056 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 29 Jun 2022 00:51:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8835D2026D07; Wed, 29 Jun 2022 00:51:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 83FC82026D64
 for <cluster-devel@redhat.com>; Wed, 29 Jun 2022 00:51:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5985F3C0F37D
 for <cluster-devel@redhat.com>; Wed, 29 Jun 2022 00:51:48 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-25Fvq-L3NQGo7b01ue2sXA-1; Tue, 28 Jun 2022 20:51:46 -0400
X-MC-Unique: 25Fvq-L3NQGo7b01ue2sXA-1
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="282980636"
X-IronPort-AV: E=Sophos;i="5.92,230,1650956400"; d="scan'208";a="282980636"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2022 17:50:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,230,1650956400"; d="scan'208";a="836903795"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 28 Jun 2022 17:50:41 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o6Lui-000AmI-RD;
 Wed, 29 Jun 2022 00:50:40 +0000
Date: Wed, 29 Jun 2022 08:50:37 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <202206290839.9woKp4xX-lkp@intel.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [Cluster-devel] [gfs2:nopid 1/5] fs/gfs2/glock.c:2759:36: warning:
 initialization of 'struct pid_namespace *' from 'int' makes pointer from
 integer without a cast
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
Cc: cluster-devel@redhat.com, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git nopid
head:   b1d0ed94e881ca5b5aee15e05f13db75445398f2
commit: 13ba8572506201aa85020970f776597fbcdcda56 [1/5] gfs2: Add glockfd debugfs file
config: csky-randconfig-r025-20220627 (https://download.01.org/0day-ci/archive/20220629/202206290839.9woKp4xX-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git/commit/?id=13ba8572506201aa85020970f776597fbcdcda56
        git remote add gfs2 https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
        git fetch --no-tags gfs2 nopid
        git checkout 13ba8572506201aa85020970f776597fbcdcda56
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash fs/gfs2/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   fs/gfs2/glock.c: In function 'gfs2_glockfd_next_task':
   fs/gfs2/glock.c:2759:36: error: implicit declaration of function 'task_active_pid_ns' [-Werror=implicit-function-declaration]
    2759 |         struct pid_namespace *ns = task_active_pid_ns(current);
         |                                    ^~~~~~~~~~~~~~~~~~
>> fs/gfs2/glock.c:2759:36: warning: initialization of 'struct pid_namespace *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   fs/gfs2/glock.c: In function 'gfs2_glockfd_next_file':
   fs/gfs2/glock.c:2785:17: error: implicit declaration of function 'fput'; did you mean 'iput'? [-Werror=implicit-function-declaration]
    2785 |                 fput(i->file);
         |                 ^~~~
         |                 iput
   cc1: some warnings being treated as errors


vim +2759 fs/gfs2/glock.c

  2756	
  2757	static struct task_struct *gfs2_glockfd_next_task(struct gfs2_glockfd_iter *i)
  2758	{
> 2759		struct pid_namespace *ns = task_active_pid_ns(current);
  2760		struct pid *pid;
  2761	
  2762		if (i->task)
  2763			put_task_struct(i->task);
  2764	
  2765		rcu_read_lock();
  2766	retry:
  2767		i->task = NULL;
  2768		pid = find_ge_pid(i->tgid, ns);
  2769		if (pid) {
  2770			i->tgid = pid_nr_ns(pid, ns);
  2771			i->task = pid_task(pid, PIDTYPE_TGID);
  2772			if (!i->task) {
  2773				i->tgid++;
  2774				goto retry;
  2775			}
  2776			get_task_struct(i->task);
  2777		}
  2778		rcu_read_unlock();
  2779		return i->task;
  2780	}
  2781	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

