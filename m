Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B83DF4E7E48
	for <lists+cluster-devel@lfdr.de>; Sat, 26 Mar 2022 01:59:17 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-Ca00k2GdMnik_bz6JngsIw-1; Fri, 25 Mar 2022 20:59:13 -0400
X-MC-Unique: Ca00k2GdMnik_bz6JngsIw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9F322A59569;
	Sat, 26 Mar 2022 00:59:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3EDEDC15D49;
	Sat, 26 Mar 2022 00:59:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B006A1940352;
	Sat, 26 Mar 2022 00:59:10 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 083971940341 for <cluster-devel@listman.corp.redhat.com>;
 Sat, 26 Mar 2022 00:59:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7AE08442CB8; Sat, 26 Mar 2022 00:59:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 76EBF442CB7
 for <cluster-devel@redhat.com>; Sat, 26 Mar 2022 00:59:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F2F01C05AA3
 for <cluster-devel@redhat.com>; Sat, 26 Mar 2022 00:59:09 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-304-E1Rt9MPQMS6aUNjUCMywiQ-1; Fri, 25 Mar 2022 20:59:05 -0400
X-MC-Unique: E1Rt9MPQMS6aUNjUCMywiQ-1
X-IronPort-AV: E=McAfee;i="6200,9189,10297"; a="319449453"
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; d="scan'208";a="319449453"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 17:59:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; d="scan'208";a="602218052"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 25 Mar 2022 17:59:02 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nXulh-000MpE-VU; Sat, 26 Mar 2022 00:59:01 +0000
Date: Sat, 26 Mar 2022 08:58:16 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <202203260813.Hh1xKAN5-lkp@intel.com>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Cluster-devel] [gfs2:for-next 16/17] fs/gfs2/file.c:1073:14:
 warning: comparison of distinct pointer types ('typeof (((1UL) << 12) -
 ((unsigned long)(iocb->ki_pos) & ~(~(((1UL) << 12) - 1)))) *' (aka
 'unsigned long *') and 'typeof (iov_iter_count(from)) *' (aka 'unsigned int
 *'))
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git for-next
head:   3d7b481b8a996e68339268487c0d3c8e54a2c274
commit: 32c8d6969d43c1bce394f75e9bcf32697146a773 [16/17] gfs2: Don't get stuck on partial buffered writes
config: i386-randconfig-a011 (https://download.01.org/0day-ci/archive/20220326/202203260813.Hh1xKAN5-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git/commit/?id=32c8d6969d43c1bce394f75e9bcf32697146a773
        git remote add gfs2 https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
        git fetch --no-tags gfs2 for-next
        git checkout 32c8d6969d43c1bce394f75e9bcf32697146a773
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/gfs2/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/gfs2/file.c:1073:14: warning: comparison of distinct pointer types ('typeof (((1UL) << 12) - ((unsigned long)(iocb->ki_pos) & ~(~(((1UL) << 12) - 1)))) *' (aka 'unsigned long *') and 'typeof (iov_iter_count(from)) *' (aka 'unsigned int *')) [-Wcompare-distinct-pointer-types]
                   min_size = min(PAGE_SIZE - offset_in_page(iocb->ki_pos),
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   1 warning generated.


vim +1073 fs/gfs2/file.c

  1005	
  1006	static ssize_t gfs2_file_buffered_write(struct kiocb *iocb,
  1007						struct iov_iter *from,
  1008						struct gfs2_holder *gh)
  1009	{
  1010		struct file *file = iocb->ki_filp;
  1011		struct inode *inode = file_inode(file);
  1012		struct gfs2_inode *ip = GFS2_I(inode);
  1013		struct gfs2_sbd *sdp = GFS2_SB(inode);
  1014		struct gfs2_holder *statfs_gh = NULL;
  1015		size_t prev_count = 0, window_size = 0;
  1016		size_t read = 0;
  1017		ssize_t ret;
  1018	
  1019		/*
  1020		 * In this function, we disable page faults when we're holding the
  1021		 * inode glock while doing I/O.  If a page fault occurs, we indicate
  1022		 * that the inode glock may be dropped, fault in the pages manually,
  1023		 * and retry.
  1024		 */
  1025	
  1026		if (inode == sdp->sd_rindex) {
  1027			statfs_gh = kmalloc(sizeof(*statfs_gh), GFP_NOFS);
  1028			if (!statfs_gh)
  1029				return -ENOMEM;
  1030		}
  1031	
  1032		gfs2_holder_init(ip->i_gl, LM_ST_EXCLUSIVE, 0, gh);
  1033	retry:
  1034		ret = gfs2_glock_nq(gh);
  1035		if (ret)
  1036			goto out_uninit;
  1037	retry_under_glock:
  1038		if (inode == sdp->sd_rindex) {
  1039			struct gfs2_inode *m_ip = GFS2_I(sdp->sd_statfs_inode);
  1040	
  1041			ret = gfs2_glock_nq_init(m_ip->i_gl, LM_ST_EXCLUSIVE,
  1042						 GL_NOCACHE, statfs_gh);
  1043			if (ret)
  1044				goto out_unlock;
  1045		}
  1046	
  1047		current->backing_dev_info = inode_to_bdi(inode);
  1048		pagefault_disable();
  1049		ret = iomap_file_buffered_write(iocb, from, &gfs2_iomap_ops);
  1050		pagefault_enable();
  1051		current->backing_dev_info = NULL;
  1052		if (ret > 0) {
  1053			iocb->ki_pos += ret;
  1054			read += ret;
  1055		}
  1056	
  1057		if (inode == sdp->sd_rindex)
  1058			gfs2_glock_dq_uninit(statfs_gh);
  1059	
  1060		if (should_fault_in_pages(ret, from, &prev_count, &window_size)) {
  1061			size_t min_size, leftover;
  1062	
  1063			/*
  1064			 * Make sure to fault in enough memory to fill at least one
  1065			 * page cache page.  Otherwise, we could end up with a partial
  1066			 * write that __iomap_write_end() treats as a zero-length
  1067			 * write, and we would get stuck.
  1068			 *
  1069			 * Note that we assume that after fault_in_iov_iter_readable(),
  1070			 * at least min_size bytes of memory will be readable.  This
  1071			 * could change with sub-page pointer color probing.
  1072			 */
> 1073			min_size = min(PAGE_SIZE - offset_in_page(iocb->ki_pos),
  1074				       iov_iter_count(from));
  1075			if (window_size < min_size)
  1076				window_size = min_size;
  1077	
  1078			gfs2_holder_allow_demote(gh);
  1079			leftover = fault_in_iov_iter_readable(from, window_size);
  1080			gfs2_holder_disallow_demote(gh);
  1081			if (window_size - leftover >= min_size) {
  1082				if (gfs2_holder_queued(gh))
  1083					goto retry_under_glock;
  1084				if (read && !(iocb->ki_flags & IOCB_DIRECT))
  1085					goto out_uninit;
  1086				goto retry;
  1087			}
  1088		}
  1089	out_unlock:
  1090		if (gfs2_holder_queued(gh))
  1091			gfs2_glock_dq(gh);
  1092	out_uninit:
  1093		gfs2_holder_uninit(gh);
  1094		if (statfs_gh)
  1095			kfree(statfs_gh);
  1096		return read ? read : ret;
  1097	}
  1098	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

