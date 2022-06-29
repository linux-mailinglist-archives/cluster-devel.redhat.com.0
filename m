Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D6D55F3AD
	for <lists+cluster-devel@lfdr.de>; Wed, 29 Jun 2022 05:03:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656471779;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=cxlliU2o118HUqnlpcwnNHnIGFzUBKduodzASDlwPcY=;
	b=C/29+DcbTB0aMGNjGOrhzfCjX4NGA/8EncSR/nlnsq784rqL9vi0G01wQX3q40eoZg9K/y
	ERsF4Nl5mArjxW4HppU70V/loCKdmW9ClwqmM1iSugVwdyQXxE1Aa36THAQk6d4tq4+7jy
	gbROQF26ynPd2QADqKE9RZ/KCYdEwJg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-eEnloRlqPGaUo7oA0BbF4w-1; Tue, 28 Jun 2022 23:02:56 -0400
X-MC-Unique: eEnloRlqPGaUo7oA0BbF4w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB9AE811E7A;
	Wed, 29 Jun 2022 03:02:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F081B4050C4A;
	Wed, 29 Jun 2022 03:02:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 857161947058;
	Wed, 29 Jun 2022 03:02:52 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AD4DE19466DF for <cluster-devel@listman.corp.redhat.com>;
 Wed, 29 Jun 2022 03:02:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 886B01678F; Wed, 29 Jun 2022 03:02:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8458C10725
 for <cluster-devel@redhat.com>; Wed, 29 Jun 2022 03:02:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6831285A581
 for <cluster-devel@redhat.com>; Wed, 29 Jun 2022 03:02:51 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-231-xMW_7mw4OUKlnMQMpQgPcw-1; Tue, 28 Jun 2022 23:02:48 -0400
X-MC-Unique: xMW_7mw4OUKlnMQMpQgPcw-1
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="343594688"
X-IronPort-AV: E=Sophos;i="5.92,230,1650956400"; d="scan'208";a="343594688"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2022 20:02:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,230,1650956400"; d="scan'208";a="658378147"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 28 Jun 2022 20:02:45 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o6NyX-000Ar6-36;
 Wed, 29 Jun 2022 03:02:45 +0000
Date: Wed, 29 Jun 2022 11:02:29 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <202206291026.52o1nw9J-lkp@intel.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Cluster-devel] [gfs2:nopid 1/5] fs/gfs2/glock.c:2759:36: error:
 implicit declaration of function 'task_active_pid_ns'
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git nopid
head:   b1d0ed94e881ca5b5aee15e05f13db75445398f2
commit: 13ba8572506201aa85020970f776597fbcdcda56 [1/5] gfs2: Add glockfd debugfs file
config: csky-randconfig-r025-20220627 (https://download.01.org/0day-ci/archive/20220629/202206291026.52o1nw9J-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   fs/gfs2/glock.c: In function 'gfs2_glockfd_next_task':
>> fs/gfs2/glock.c:2759:36: error: implicit declaration of function 'task_active_pid_ns' [-Werror=implicit-function-declaration]
    2759 |         struct pid_namespace *ns = task_active_pid_ns(current);
         |                                    ^~~~~~~~~~~~~~~~~~
   fs/gfs2/glock.c:2759:36: warning: initialization of 'struct pid_namespace *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   fs/gfs2/glock.c: In function 'gfs2_glockfd_next_file':
>> fs/gfs2/glock.c:2785:17: error: implicit declaration of function 'fput'; did you mean 'iput'? [-Werror=implicit-function-declaration]
    2785 |                 fput(i->file);
         |                 ^~~~
         |                 iput
   cc1: some warnings being treated as errors


vim +/task_active_pid_ns +2759 fs/gfs2/glock.c

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
  2782	static struct file *gfs2_glockfd_next_file(struct gfs2_glockfd_iter *i)
  2783	{
  2784		if (i->file) {
> 2785			fput(i->file);
  2786			i->file = NULL;
  2787		}
  2788	
  2789		rcu_read_lock();
  2790		for(;; i->fd++) {
  2791			struct inode *inode;
  2792	
  2793			i->file = task_lookup_next_fd_rcu(i->task, &i->fd);
  2794			if (!i->file) {
  2795				i->fd = 0;
  2796				break;
  2797			}
  2798			inode = file_inode(i->file);
  2799			if (inode->i_sb != i->sb)
  2800				continue;
  2801			if (get_file_rcu(i->file))
  2802				break;
  2803		}
  2804		rcu_read_unlock();
  2805		return i->file;
  2806	}
  2807	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

