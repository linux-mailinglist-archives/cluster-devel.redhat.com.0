Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA9953F4A7
	for <lists+cluster-devel@lfdr.de>; Tue,  7 Jun 2022 05:39:59 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-vswm79InNraah-7TkelONw-1; Mon, 06 Jun 2022 23:39:55 -0400
X-MC-Unique: vswm79InNraah-7TkelONw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E2B618A64EA;
	Tue,  7 Jun 2022 03:39:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8DF8F2166B26;
	Tue,  7 Jun 2022 03:39:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 43EFD19452D8;
	Tue,  7 Jun 2022 03:39:52 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 25EE9194707B for <cluster-devel@listman.corp.redhat.com>;
 Tue,  7 Jun 2022 03:39:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 08CC42166B29; Tue,  7 Jun 2022 03:39:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 046842166B26
 for <cluster-devel@redhat.com>; Tue,  7 Jun 2022 03:39:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCC3A1011637
 for <cluster-devel@redhat.com>; Tue,  7 Jun 2022 03:39:50 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-RT3f2s3QP76PHrWA8fP3wQ-1; Mon, 06 Jun 2022 23:39:49 -0400
X-MC-Unique: RT3f2s3QP76PHrWA8fP3wQ-1
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="275480644"
X-IronPort-AV: E=Sophos;i="5.91,282,1647327600"; d="scan'208";a="275480644"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 20:38:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,282,1647327600"; d="scan'208";a="579430786"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 06 Jun 2022 20:38:40 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nyQ3D-000DJf-KE;
 Tue, 07 Jun 2022 03:38:39 +0000
Date: Tue, 7 Jun 2022 11:37:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 linux-fsdevel@vger.kernel.org
Message-ID: <202206071139.aWSx4GHH-lkp@intel.com>
References: <20220606204050.2625949-5-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20220606204050.2625949-5-willy@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH 04/20] mm/migrate: Convert
 buffer_migrate_page() to buffer_migrate_folio()
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
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org, cluster-devel@redhat.com,
 kbuild-all@lists.01.org, linux-ntfs-dev@lists.sourceforge.net,
 linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com,
 linux-ext4@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi "Matthew,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.19-rc1 next-20220606]
[cannot apply to jaegeuk-f2fs/dev-test trondmy-nfs/linux-next kdave/for-next xfs-linux/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/Convert-aops-migratepage-to-aops-migrate_folio/20220607-044509
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git f2906aa863381afb0015a9eb7fefad885d4e5a56
config: i386-defconfig (https://download.01.org/0day-ci/archive/20220607/202206071139.aWSx4GHH-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/96e64ba8b1be545885d89f44b1d8b968b22bdb4d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Matthew-Wilcox-Oracle/Convert-aops-migratepage-to-aops-migrate_folio/20220607-044509
        git checkout 96e64ba8b1be545885d89f44b1d8b968b22bdb4d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/migrate.c:775: warning: expecting prototype for buffer_migrate_folio_noref(). Prototype was for buffer_migrate_folio_norefs() instead


vim +775 mm/migrate.c

89cb0888ca1483a Jan Kara                2018-12-28  758  
96e64ba8b1be545 Matthew Wilcox (Oracle  2022-06-06  759) /**
96e64ba8b1be545 Matthew Wilcox (Oracle  2022-06-06  760)  * buffer_migrate_folio_noref() - Migration function for folios with buffers.
96e64ba8b1be545 Matthew Wilcox (Oracle  2022-06-06  761)  * @mapping: The address space containing @src.
96e64ba8b1be545 Matthew Wilcox (Oracle  2022-06-06  762)  * @dst: The folio to migrate to.
96e64ba8b1be545 Matthew Wilcox (Oracle  2022-06-06  763)  * @src: The folio to migrate from.
96e64ba8b1be545 Matthew Wilcox (Oracle  2022-06-06  764)  * @mode: How to migrate the folio.
96e64ba8b1be545 Matthew Wilcox (Oracle  2022-06-06  765)  *
96e64ba8b1be545 Matthew Wilcox (Oracle  2022-06-06  766)  * Like buffer_migrate_folio() except that this variant is more careful
96e64ba8b1be545 Matthew Wilcox (Oracle  2022-06-06  767)  * and checks that there are also no buffer head references. This function
96e64ba8b1be545 Matthew Wilcox (Oracle  2022-06-06  768)  * is the right one for mappings where buffer heads are directly looked
96e64ba8b1be545 Matthew Wilcox (Oracle  2022-06-06  769)  * up and referenced (such as block device mappings).
96e64ba8b1be545 Matthew Wilcox (Oracle  2022-06-06  770)  *
96e64ba8b1be545 Matthew Wilcox (Oracle  2022-06-06  771)  * Return: 0 on success or a negative errno on failure.
89cb0888ca1483a Jan Kara                2018-12-28  772   */
96e64ba8b1be545 Matthew Wilcox (Oracle  2022-06-06  773) int buffer_migrate_folio_norefs(struct address_space *mapping,
96e64ba8b1be545 Matthew Wilcox (Oracle  2022-06-06  774) 		struct folio *dst, struct folio *src, enum migrate_mode mode)
89cb0888ca1483a Jan Kara                2018-12-28 @775  {
96e64ba8b1be545 Matthew Wilcox (Oracle  2022-06-06  776) 	return __buffer_migrate_folio(mapping, dst, src, mode, true);
89cb0888ca1483a Jan Kara                2018-12-28  777  }
9361401eb7619c0 David Howells           2006-09-30  778  #endif
1d8b85ccf1ed53a Christoph Lameter       2006-06-23  779  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

