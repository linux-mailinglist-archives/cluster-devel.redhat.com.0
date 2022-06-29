Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A2855F313
	for <lists+cluster-devel@lfdr.de>; Wed, 29 Jun 2022 04:02:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656468119;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=TRF/VE2Xy21eaxnUPyIyGcosBcAHmB0jVESMjMWcu4Y=;
	b=PXXWSMK6EM0HxwElT/DKca7JVoJGH4+RsCteg8iYaga/VruGiBmiwx1+GsyqclPdMXYn9z
	suhtqCVfUZeJScrtgMvOFHb+9N03GGayKvyKNiKZ5DJJvEDs6eTfXMU9bsUyr6XDZ/Zx3V
	73AlgvU6fQYdrP9JY2k5hrA6UkOTfNM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-3eT6OM4wP-Wow6zVoPnC7A-1; Tue, 28 Jun 2022 22:01:56 -0400
X-MC-Unique: 3eT6OM4wP-Wow6zVoPnC7A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0FF2101A586;
	Wed, 29 Jun 2022 02:01:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F3B482166B26;
	Wed, 29 Jun 2022 02:01:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 59DC51947058;
	Wed, 29 Jun 2022 02:01:53 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 11D3719466DF for <cluster-devel@listman.corp.redhat.com>;
 Wed, 29 Jun 2022 02:01:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E27BB2166B29; Wed, 29 Jun 2022 02:01:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DECC72166B26
 for <cluster-devel@redhat.com>; Wed, 29 Jun 2022 02:01:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1A87294EDCE
 for <cluster-devel@redhat.com>; Wed, 29 Jun 2022 02:01:51 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173-Wgo2nQFHNt-Ha6tpJvdI1A-1; Tue, 28 Jun 2022 22:01:47 -0400
X-MC-Unique: Wgo2nQFHNt-Ha6tpJvdI1A-1
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="282630564"
X-IronPort-AV: E=Sophos;i="5.92,230,1650956400"; d="scan'208";a="282630564"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2022 19:01:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,230,1650956400"; d="scan'208";a="917411138"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 28 Jun 2022 19:01:43 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o6N1S-000Ap0-Ez;
 Wed, 29 Jun 2022 02:01:42 +0000
Date: Wed, 29 Jun 2022 10:01:25 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <202206290953.iT9zAjZQ-lkp@intel.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: [Cluster-devel] [gfs2:nopid 1/5] fs/gfs2/glock.c:2785:3: error:
 call to undeclared function 'fput';
 ISO C99 and later do not support implicit function declarations
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
Cc: cluster-devel@redhat.com, llvm@lists.linux.dev, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git nopid
head:   b1d0ed94e881ca5b5aee15e05f13db75445398f2
commit: 13ba8572506201aa85020970f776597fbcdcda56 [1/5] gfs2: Add glockfd debugfs file
config: arm64-buildonly-randconfig-r005-20220627 (https://download.01.org/0day-ci/archive/20220629/202206290953.iT9zAjZQ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project df18167ac56d05f2ab55f9d874aee7ab6d5bc9a2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git/commit/?id=13ba8572506201aa85020970f776597fbcdcda56
        git remote add gfs2 https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
        git fetch --no-tags gfs2 nopid
        git checkout 13ba8572506201aa85020970f776597fbcdcda56
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/gfs2/glock.c:2785:3: error: call to undeclared function 'fput'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   fput(i->file);
                   ^
   fs/gfs2/glock.c:2842:3: error: call to undeclared function 'fput'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   fput(i->file);
                   ^
   2 errors generated.


vim +/fput +2785 fs/gfs2/glock.c

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

