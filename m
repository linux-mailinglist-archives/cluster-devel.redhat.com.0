Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1D3A042CD1E
	for <lists+cluster-devel@lfdr.de>; Wed, 13 Oct 2021 23:50:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-e21Js99OMhyZVoJ9e2ekYg-1; Wed, 13 Oct 2021 17:50:05 -0400
X-MC-Unique: e21Js99OMhyZVoJ9e2ekYg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D5A619067E0;
	Wed, 13 Oct 2021 21:50:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BFD8100238C;
	Wed, 13 Oct 2021 21:50:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E71FD4A703;
	Wed, 13 Oct 2021 21:49:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19DLnqST032070 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 Oct 2021 17:49:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 01CBE114B2E4; Wed, 13 Oct 2021 21:49:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EFEC9114B2E1
	for <cluster-devel@redhat.com>; Wed, 13 Oct 2021 21:49:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2F168007B1
	for <cluster-devel@redhat.com>; Wed, 13 Oct 2021 21:49:48 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-394-H02lI3J6NACxDKsGd0mdXw-1;
	Wed, 13 Oct 2021 17:49:45 -0400
X-MC-Unique: H02lI3J6NACxDKsGd0mdXw-1
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="313746495"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; 
	d="gz'50?scan'50,208,50";a="313746495"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	13 Oct 2021 14:48:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; 
	d="gz'50?scan'50,208,50";a="626591191"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
	by fmsmga001.fm.intel.com with ESMTP; 13 Oct 2021 14:48:39 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mam75-0005Aj-9t; Wed, 13 Oct 2021 21:48:39 +0000
Date: Thu, 14 Oct 2021 05:48:16 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <202110140509.ibrcGepZ-lkp@intel.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [gfs2:for-next 4/38] fs/ntfs3/file.c:990:30: error:
 implicit declaration of function 'iov_iter_fault_in_readable';
 did you mean 'fault_in_readable'?
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline

--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git for-next
head:   9d0084204c8a7e01f9b8ebe81402be61e0a67a62
commit: 4b03be65e2d7c2a3c7a83d28d5f9882e9dcf178d [4/38] iov_iter: Turn iov_iter_fault_in_readable into fault_in_iov_iter_readable
config: nios2-randconfig-r003-20211013 (attached as .config)
compiler: nios2-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git/commit/?id=4b03be65e2d7c2a3c7a83d28d5f9882e9dcf178d
        git remote add gfs2 https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
        git fetch --no-tags gfs2 for-next
        git checkout 4b03be65e2d7c2a3c7a83d28d5f9882e9dcf178d
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross ARCH=nios2 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:11,
                    from include/linux/backing-dev.h:12,
                    from fs/ntfs3/file.c:10:
   fs/ntfs3/file.c: In function 'ntfs_compress_write':
>> fs/ntfs3/file.c:990:30: error: implicit declaration of function 'iov_iter_fault_in_readable'; did you mean 'fault_in_readable'? [-Werror=implicit-function-declaration]
     990 |                 if (unlikely(iov_iter_fault_in_readable(from, bytes))) {
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
      78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   cc1: some warnings being treated as errors


vim +990 fs/ntfs3/file.c

4342306f0f0d5f Konstantin Komarov 2021-08-13   863  
e8b8e97f91b80f Kari Argillander   2021-08-03   864  /*
e8b8e97f91b80f Kari Argillander   2021-08-03   865   * ntfs_compress_write - Helper for ntfs_file_write_iter() (compressed files).
e8b8e97f91b80f Kari Argillander   2021-08-03   866   */
4342306f0f0d5f Konstantin Komarov 2021-08-13   867  static ssize_t ntfs_compress_write(struct kiocb *iocb, struct iov_iter *from)
4342306f0f0d5f Konstantin Komarov 2021-08-13   868  {
4342306f0f0d5f Konstantin Komarov 2021-08-13   869  	int err;
4342306f0f0d5f Konstantin Komarov 2021-08-13   870  	struct file *file = iocb->ki_filp;
4342306f0f0d5f Konstantin Komarov 2021-08-13   871  	size_t count = iov_iter_count(from);
4342306f0f0d5f Konstantin Komarov 2021-08-13   872  	loff_t pos = iocb->ki_pos;
4342306f0f0d5f Konstantin Komarov 2021-08-13   873  	struct inode *inode = file_inode(file);
4342306f0f0d5f Konstantin Komarov 2021-08-13   874  	loff_t i_size = inode->i_size;
4342306f0f0d5f Konstantin Komarov 2021-08-13   875  	struct address_space *mapping = inode->i_mapping;
4342306f0f0d5f Konstantin Komarov 2021-08-13   876  	struct ntfs_inode *ni = ntfs_i(inode);
4342306f0f0d5f Konstantin Komarov 2021-08-13   877  	u64 valid = ni->i_valid;
4342306f0f0d5f Konstantin Komarov 2021-08-13   878  	struct ntfs_sb_info *sbi = ni->mi.sbi;
4342306f0f0d5f Konstantin Komarov 2021-08-13   879  	struct page *page, **pages = NULL;
4342306f0f0d5f Konstantin Komarov 2021-08-13   880  	size_t written = 0;
4342306f0f0d5f Konstantin Komarov 2021-08-13   881  	u8 frame_bits = NTFS_LZNT_CUNIT + sbi->cluster_bits;
4342306f0f0d5f Konstantin Komarov 2021-08-13   882  	u32 frame_size = 1u << frame_bits;
4342306f0f0d5f Konstantin Komarov 2021-08-13   883  	u32 pages_per_frame = frame_size >> PAGE_SHIFT;
4342306f0f0d5f Konstantin Komarov 2021-08-13   884  	u32 ip, off;
4342306f0f0d5f Konstantin Komarov 2021-08-13   885  	CLST frame;
4342306f0f0d5f Konstantin Komarov 2021-08-13   886  	u64 frame_vbo;
4342306f0f0d5f Konstantin Komarov 2021-08-13   887  	pgoff_t index;
4342306f0f0d5f Konstantin Komarov 2021-08-13   888  	bool frame_uptodate;
4342306f0f0d5f Konstantin Komarov 2021-08-13   889  
4342306f0f0d5f Konstantin Komarov 2021-08-13   890  	if (frame_size < PAGE_SIZE) {
4342306f0f0d5f Konstantin Komarov 2021-08-13   891  		/*
4342306f0f0d5f Konstantin Komarov 2021-08-13   892  		 * frame_size == 8K if cluster 512
4342306f0f0d5f Konstantin Komarov 2021-08-13   893  		 * frame_size == 64K if cluster 4096
4342306f0f0d5f Konstantin Komarov 2021-08-13   894  		 */
4342306f0f0d5f Konstantin Komarov 2021-08-13   895  		ntfs_inode_warn(inode, "page size is bigger than frame size");
4342306f0f0d5f Konstantin Komarov 2021-08-13   896  		return -EOPNOTSUPP;
4342306f0f0d5f Konstantin Komarov 2021-08-13   897  	}
4342306f0f0d5f Konstantin Komarov 2021-08-13   898  
345482bc431f64 Kari Argillander   2021-08-24   899  	pages = kmalloc_array(pages_per_frame, sizeof(struct page *), GFP_NOFS);
4342306f0f0d5f Konstantin Komarov 2021-08-13   900  	if (!pages)
4342306f0f0d5f Konstantin Komarov 2021-08-13   901  		return -ENOMEM;
4342306f0f0d5f Konstantin Komarov 2021-08-13   902  
4342306f0f0d5f Konstantin Komarov 2021-08-13   903  	current->backing_dev_info = inode_to_bdi(inode);
4342306f0f0d5f Konstantin Komarov 2021-08-13   904  	err = file_remove_privs(file);
4342306f0f0d5f Konstantin Komarov 2021-08-13   905  	if (err)
4342306f0f0d5f Konstantin Komarov 2021-08-13   906  		goto out;
4342306f0f0d5f Konstantin Komarov 2021-08-13   907  
4342306f0f0d5f Konstantin Komarov 2021-08-13   908  	err = file_update_time(file);
4342306f0f0d5f Konstantin Komarov 2021-08-13   909  	if (err)
4342306f0f0d5f Konstantin Komarov 2021-08-13   910  		goto out;
4342306f0f0d5f Konstantin Komarov 2021-08-13   911  
e8b8e97f91b80f Kari Argillander   2021-08-03   912  	/* Zero range [valid : pos). */
4342306f0f0d5f Konstantin Komarov 2021-08-13   913  	while (valid < pos) {
4342306f0f0d5f Konstantin Komarov 2021-08-13   914  		CLST lcn, clen;
4342306f0f0d5f Konstantin Komarov 2021-08-13   915  
4342306f0f0d5f Konstantin Komarov 2021-08-13   916  		frame = valid >> frame_bits;
4342306f0f0d5f Konstantin Komarov 2021-08-13   917  		frame_vbo = valid & ~(frame_size - 1);
4342306f0f0d5f Konstantin Komarov 2021-08-13   918  		off = valid & (frame_size - 1);
4342306f0f0d5f Konstantin Komarov 2021-08-13   919  
4342306f0f0d5f Konstantin Komarov 2021-08-13   920  		err = attr_data_get_block(ni, frame << NTFS_LZNT_CUNIT, 0, &lcn,
4342306f0f0d5f Konstantin Komarov 2021-08-13   921  					  &clen, NULL);
4342306f0f0d5f Konstantin Komarov 2021-08-13   922  		if (err)
4342306f0f0d5f Konstantin Komarov 2021-08-13   923  			goto out;
4342306f0f0d5f Konstantin Komarov 2021-08-13   924  
4342306f0f0d5f Konstantin Komarov 2021-08-13   925  		if (lcn == SPARSE_LCN) {
4342306f0f0d5f Konstantin Komarov 2021-08-13   926  			ni->i_valid = valid =
4342306f0f0d5f Konstantin Komarov 2021-08-13   927  				frame_vbo + ((u64)clen << sbi->cluster_bits);
4342306f0f0d5f Konstantin Komarov 2021-08-13   928  			continue;
4342306f0f0d5f Konstantin Komarov 2021-08-13   929  		}
4342306f0f0d5f Konstantin Komarov 2021-08-13   930  
e8b8e97f91b80f Kari Argillander   2021-08-03   931  		/* Load full frame. */
4342306f0f0d5f Konstantin Komarov 2021-08-13   932  		err = ntfs_get_frame_pages(mapping, frame_vbo >> PAGE_SHIFT,
4342306f0f0d5f Konstantin Komarov 2021-08-13   933  					   pages, pages_per_frame,
4342306f0f0d5f Konstantin Komarov 2021-08-13   934  					   &frame_uptodate);
4342306f0f0d5f Konstantin Komarov 2021-08-13   935  		if (err)
4342306f0f0d5f Konstantin Komarov 2021-08-13   936  			goto out;
4342306f0f0d5f Konstantin Komarov 2021-08-13   937  
4342306f0f0d5f Konstantin Komarov 2021-08-13   938  		if (!frame_uptodate && off) {
4342306f0f0d5f Konstantin Komarov 2021-08-13   939  			err = ni_read_frame(ni, frame_vbo, pages,
4342306f0f0d5f Konstantin Komarov 2021-08-13   940  					    pages_per_frame);
4342306f0f0d5f Konstantin Komarov 2021-08-13   941  			if (err) {
4342306f0f0d5f Konstantin Komarov 2021-08-13   942  				for (ip = 0; ip < pages_per_frame; ip++) {
4342306f0f0d5f Konstantin Komarov 2021-08-13   943  					page = pages[ip];
4342306f0f0d5f Konstantin Komarov 2021-08-13   944  					unlock_page(page);
4342306f0f0d5f Konstantin Komarov 2021-08-13   945  					put_page(page);
4342306f0f0d5f Konstantin Komarov 2021-08-13   946  				}
4342306f0f0d5f Konstantin Komarov 2021-08-13   947  				goto out;
4342306f0f0d5f Konstantin Komarov 2021-08-13   948  			}
4342306f0f0d5f Konstantin Komarov 2021-08-13   949  		}
4342306f0f0d5f Konstantin Komarov 2021-08-13   950  
4342306f0f0d5f Konstantin Komarov 2021-08-13   951  		ip = off >> PAGE_SHIFT;
4342306f0f0d5f Konstantin Komarov 2021-08-13   952  		off = offset_in_page(valid);
4342306f0f0d5f Konstantin Komarov 2021-08-13   953  		for (; ip < pages_per_frame; ip++, off = 0) {
4342306f0f0d5f Konstantin Komarov 2021-08-13   954  			page = pages[ip];
4342306f0f0d5f Konstantin Komarov 2021-08-13   955  			zero_user_segment(page, off, PAGE_SIZE);
4342306f0f0d5f Konstantin Komarov 2021-08-13   956  			flush_dcache_page(page);
4342306f0f0d5f Konstantin Komarov 2021-08-13   957  			SetPageUptodate(page);
4342306f0f0d5f Konstantin Komarov 2021-08-13   958  		}
4342306f0f0d5f Konstantin Komarov 2021-08-13   959  
4342306f0f0d5f Konstantin Komarov 2021-08-13   960  		ni_lock(ni);
4342306f0f0d5f Konstantin Komarov 2021-08-13   961  		err = ni_write_frame(ni, pages, pages_per_frame);
4342306f0f0d5f Konstantin Komarov 2021-08-13   962  		ni_unlock(ni);
4342306f0f0d5f Konstantin Komarov 2021-08-13   963  
4342306f0f0d5f Konstantin Komarov 2021-08-13   964  		for (ip = 0; ip < pages_per_frame; ip++) {
4342306f0f0d5f Konstantin Komarov 2021-08-13   965  			page = pages[ip];
4342306f0f0d5f Konstantin Komarov 2021-08-13   966  			SetPageUptodate(page);
4342306f0f0d5f Konstantin Komarov 2021-08-13   967  			unlock_page(page);
4342306f0f0d5f Konstantin Komarov 2021-08-13   968  			put_page(page);
4342306f0f0d5f Konstantin Komarov 2021-08-13   969  		}
4342306f0f0d5f Konstantin Komarov 2021-08-13   970  
4342306f0f0d5f Konstantin Komarov 2021-08-13   971  		if (err)
4342306f0f0d5f Konstantin Komarov 2021-08-13   972  			goto out;
4342306f0f0d5f Konstantin Komarov 2021-08-13   973  
4342306f0f0d5f Konstantin Komarov 2021-08-13   974  		ni->i_valid = valid = frame_vbo + frame_size;
4342306f0f0d5f Konstantin Komarov 2021-08-13   975  	}
4342306f0f0d5f Konstantin Komarov 2021-08-13   976  
e8b8e97f91b80f Kari Argillander   2021-08-03   977  	/* Copy user data [pos : pos + count). */
4342306f0f0d5f Konstantin Komarov 2021-08-13   978  	while (count) {
4342306f0f0d5f Konstantin Komarov 2021-08-13   979  		size_t copied, bytes;
4342306f0f0d5f Konstantin Komarov 2021-08-13   980  
4342306f0f0d5f Konstantin Komarov 2021-08-13   981  		off = pos & (frame_size - 1);
4342306f0f0d5f Konstantin Komarov 2021-08-13   982  		bytes = frame_size - off;
4342306f0f0d5f Konstantin Komarov 2021-08-13   983  		if (bytes > count)
4342306f0f0d5f Konstantin Komarov 2021-08-13   984  			bytes = count;
4342306f0f0d5f Konstantin Komarov 2021-08-13   985  
4342306f0f0d5f Konstantin Komarov 2021-08-13   986  		frame = pos >> frame_bits;
4342306f0f0d5f Konstantin Komarov 2021-08-13   987  		frame_vbo = pos & ~(frame_size - 1);
4342306f0f0d5f Konstantin Komarov 2021-08-13   988  		index = frame_vbo >> PAGE_SHIFT;
4342306f0f0d5f Konstantin Komarov 2021-08-13   989  
4342306f0f0d5f Konstantin Komarov 2021-08-13  @990  		if (unlikely(iov_iter_fault_in_readable(from, bytes))) {
4342306f0f0d5f Konstantin Komarov 2021-08-13   991  			err = -EFAULT;
4342306f0f0d5f Konstantin Komarov 2021-08-13   992  			goto out;
4342306f0f0d5f Konstantin Komarov 2021-08-13   993  		}
4342306f0f0d5f Konstantin Komarov 2021-08-13   994  
e8b8e97f91b80f Kari Argillander   2021-08-03   995  		/* Load full frame. */
4342306f0f0d5f Konstantin Komarov 2021-08-13   996  		err = ntfs_get_frame_pages(mapping, index, pages,
4342306f0f0d5f Konstantin Komarov 2021-08-13   997  					   pages_per_frame, &frame_uptodate);
4342306f0f0d5f Konstantin Komarov 2021-08-13   998  		if (err)
4342306f0f0d5f Konstantin Komarov 2021-08-13   999  			goto out;
4342306f0f0d5f Konstantin Komarov 2021-08-13  1000  
4342306f0f0d5f Konstantin Komarov 2021-08-13  1001  		if (!frame_uptodate) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  1002  			loff_t to = pos + bytes;
4342306f0f0d5f Konstantin Komarov 2021-08-13  1003  
4342306f0f0d5f Konstantin Komarov 2021-08-13  1004  			if (off || (to < i_size && (to & (frame_size - 1)))) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  1005  				err = ni_read_frame(ni, frame_vbo, pages,
4342306f0f0d5f Konstantin Komarov 2021-08-13  1006  						    pages_per_frame);
4342306f0f0d5f Konstantin Komarov 2021-08-13  1007  				if (err) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  1008  					for (ip = 0; ip < pages_per_frame;
4342306f0f0d5f Konstantin Komarov 2021-08-13  1009  					     ip++) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  1010  						page = pages[ip];
4342306f0f0d5f Konstantin Komarov 2021-08-13  1011  						unlock_page(page);
4342306f0f0d5f Konstantin Komarov 2021-08-13  1012  						put_page(page);
4342306f0f0d5f Konstantin Komarov 2021-08-13  1013  					}
4342306f0f0d5f Konstantin Komarov 2021-08-13  1014  					goto out;
4342306f0f0d5f Konstantin Komarov 2021-08-13  1015  				}
4342306f0f0d5f Konstantin Komarov 2021-08-13  1016  			}
4342306f0f0d5f Konstantin Komarov 2021-08-13  1017  		}
4342306f0f0d5f Konstantin Komarov 2021-08-13  1018  
4342306f0f0d5f Konstantin Komarov 2021-08-13  1019  		WARN_ON(!bytes);
4342306f0f0d5f Konstantin Komarov 2021-08-13  1020  		copied = 0;
4342306f0f0d5f Konstantin Komarov 2021-08-13  1021  		ip = off >> PAGE_SHIFT;
4342306f0f0d5f Konstantin Komarov 2021-08-13  1022  		off = offset_in_page(pos);
4342306f0f0d5f Konstantin Komarov 2021-08-13  1023  
e8b8e97f91b80f Kari Argillander   2021-08-03  1024  		/* Copy user data to pages. */
4342306f0f0d5f Konstantin Komarov 2021-08-13  1025  		for (;;) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  1026  			size_t cp, tail = PAGE_SIZE - off;
4342306f0f0d5f Konstantin Komarov 2021-08-13  1027  
4342306f0f0d5f Konstantin Komarov 2021-08-13  1028  			page = pages[ip];
4342306f0f0d5f Konstantin Komarov 2021-08-13  1029  			cp = copy_page_from_iter_atomic(page, off,
4342306f0f0d5f Konstantin Komarov 2021-08-13  1030  							min(tail, bytes), from);
4342306f0f0d5f Konstantin Komarov 2021-08-13  1031  			flush_dcache_page(page);
4342306f0f0d5f Konstantin Komarov 2021-08-13  1032  
4342306f0f0d5f Konstantin Komarov 2021-08-13  1033  			copied += cp;
4342306f0f0d5f Konstantin Komarov 2021-08-13  1034  			bytes -= cp;
4342306f0f0d5f Konstantin Komarov 2021-08-13  1035  			if (!bytes || !cp)
4342306f0f0d5f Konstantin Komarov 2021-08-13  1036  				break;
4342306f0f0d5f Konstantin Komarov 2021-08-13  1037  
4342306f0f0d5f Konstantin Komarov 2021-08-13  1038  			if (cp < tail) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  1039  				off += cp;
4342306f0f0d5f Konstantin Komarov 2021-08-13  1040  			} else {
4342306f0f0d5f Konstantin Komarov 2021-08-13  1041  				ip++;
4342306f0f0d5f Konstantin Komarov 2021-08-13  1042  				off = 0;
4342306f0f0d5f Konstantin Komarov 2021-08-13  1043  			}
4342306f0f0d5f Konstantin Komarov 2021-08-13  1044  		}
4342306f0f0d5f Konstantin Komarov 2021-08-13  1045  
4342306f0f0d5f Konstantin Komarov 2021-08-13  1046  		ni_lock(ni);
4342306f0f0d5f Konstantin Komarov 2021-08-13  1047  		err = ni_write_frame(ni, pages, pages_per_frame);
4342306f0f0d5f Konstantin Komarov 2021-08-13  1048  		ni_unlock(ni);
4342306f0f0d5f Konstantin Komarov 2021-08-13  1049  
4342306f0f0d5f Konstantin Komarov 2021-08-13  1050  		for (ip = 0; ip < pages_per_frame; ip++) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  1051  			page = pages[ip];
4342306f0f0d5f Konstantin Komarov 2021-08-13  1052  			ClearPageDirty(page);
4342306f0f0d5f Konstantin Komarov 2021-08-13  1053  			SetPageUptodate(page);
4342306f0f0d5f Konstantin Komarov 2021-08-13  1054  			unlock_page(page);
4342306f0f0d5f Konstantin Komarov 2021-08-13  1055  			put_page(page);
4342306f0f0d5f Konstantin Komarov 2021-08-13  1056  		}
4342306f0f0d5f Konstantin Komarov 2021-08-13  1057  
4342306f0f0d5f Konstantin Komarov 2021-08-13  1058  		if (err)
4342306f0f0d5f Konstantin Komarov 2021-08-13  1059  			goto out;
4342306f0f0d5f Konstantin Komarov 2021-08-13  1060  
4342306f0f0d5f Konstantin Komarov 2021-08-13  1061  		/*
4342306f0f0d5f Konstantin Komarov 2021-08-13  1062  		 * We can loop for a long time in here. Be nice and allow
4342306f0f0d5f Konstantin Komarov 2021-08-13  1063  		 * us to schedule out to avoid softlocking if preempt
4342306f0f0d5f Konstantin Komarov 2021-08-13  1064  		 * is disabled.
4342306f0f0d5f Konstantin Komarov 2021-08-13  1065  		 */
4342306f0f0d5f Konstantin Komarov 2021-08-13  1066  		cond_resched();
4342306f0f0d5f Konstantin Komarov 2021-08-13  1067  
4342306f0f0d5f Konstantin Komarov 2021-08-13  1068  		pos += copied;
4342306f0f0d5f Konstantin Komarov 2021-08-13  1069  		written += copied;
4342306f0f0d5f Konstantin Komarov 2021-08-13  1070  
4342306f0f0d5f Konstantin Komarov 2021-08-13  1071  		count = iov_iter_count(from);
4342306f0f0d5f Konstantin Komarov 2021-08-13  1072  	}
4342306f0f0d5f Konstantin Komarov 2021-08-13  1073  
4342306f0f0d5f Konstantin Komarov 2021-08-13  1074  out:
195c52bdd5d5ec Kari Argillander   2021-08-24  1075  	kfree(pages);
4342306f0f0d5f Konstantin Komarov 2021-08-13  1076  
4342306f0f0d5f Konstantin Komarov 2021-08-13  1077  	current->backing_dev_info = NULL;
4342306f0f0d5f Konstantin Komarov 2021-08-13  1078  
4342306f0f0d5f Konstantin Komarov 2021-08-13  1079  	if (err < 0)
4342306f0f0d5f Konstantin Komarov 2021-08-13  1080  		return err;
4342306f0f0d5f Konstantin Komarov 2021-08-13  1081  
4342306f0f0d5f Konstantin Komarov 2021-08-13  1082  	iocb->ki_pos += written;
4342306f0f0d5f Konstantin Komarov 2021-08-13  1083  	if (iocb->ki_pos > ni->i_valid)
4342306f0f0d5f Konstantin Komarov 2021-08-13  1084  		ni->i_valid = iocb->ki_pos;
4342306f0f0d5f Konstantin Komarov 2021-08-13  1085  
4342306f0f0d5f Konstantin Komarov 2021-08-13  1086  	return written;
4342306f0f0d5f Konstantin Komarov 2021-08-13  1087  }
4342306f0f0d5f Konstantin Komarov 2021-08-13  1088  

:::::: The code at line 990 was first introduced by commit
:::::: 4342306f0f0d5ff4315a204d315c1b51b914fca5 fs/ntfs3: Add file operations and implementation

:::::: TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
:::::: CC: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--+QahgC5+KEYLbs62
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
zVLFOGmjWkfR9f8ktqZythQCAA==
--+QahgC5+KEYLbs62--

