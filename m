Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTP id B8BA342CF48
	for <lists+cluster-devel@lfdr.de>; Thu, 14 Oct 2021 01:45:45 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-9KXDYxErOqaIuVOA1t-5rw-1; Wed, 13 Oct 2021 19:45:43 -0400
X-MC-Unique: 9KXDYxErOqaIuVOA1t-5rw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D02A80363C;
	Wed, 13 Oct 2021 23:45:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4592D641AA;
	Wed, 13 Oct 2021 23:45:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF42C1800FE4;
	Wed, 13 Oct 2021 23:45:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19DNh2oT008103 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 Oct 2021 19:43:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C3CB4400E410; Wed, 13 Oct 2021 23:43:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF0D840C1256
	for <cluster-devel@redhat.com>; Wed, 13 Oct 2021 23:43:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9EDB4185A7A4
	for <cluster-devel@redhat.com>; Wed, 13 Oct 2021 23:43:02 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-135-kJrRQgN4NpW9rVLetPddHw-1;
	Wed, 13 Oct 2021 19:42:49 -0400
X-MC-Unique: kJrRQgN4NpW9rVLetPddHw-1
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="226334192"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; 
	d="gz'50?scan'50,208,50";a="226334192"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	13 Oct 2021 16:42:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; 
	d="gz'50?scan'50,208,50";a="659745779"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
	by orsmga005.jf.intel.com with ESMTP; 13 Oct 2021 16:42:46 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mantV-0005IF-C3; Wed, 13 Oct 2021 23:42:45 +0000
Date: Thu, 14 Oct 2021 07:42:21 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <202110140713.Iq5e8l66-lkp@intel.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [gfs2:for-next 4/38] fs/ntfs3/file.c:990:16: error:
 implicit declaration of function 'iov_iter_fault_in_readable'
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline

--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git for-next
head:   9d0084204c8a7e01f9b8ebe81402be61e0a67a62
commit: 4b03be65e2d7c2a3c7a83d28d5f9882e9dcf178d [4/38] iov_iter: Turn iov_iter_fault_in_readable into fault_in_iov_iter_readable
config: hexagon-randconfig-r045-20211013 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a8c695542b2987eb9a203d5663a0740cb4725f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git/commit/?id=4b03be65e2d7c2a3c7a83d28d5f9882e9dcf178d
        git remote add gfs2 https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
        git fetch --no-tags gfs2 for-next
        git checkout 4b03be65e2d7c2a3c7a83d28d5f9882e9dcf178d
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=hexagon 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/ntfs3/file.c:990:16: error: implicit declaration of function 'iov_iter_fault_in_readable' [-Werror,-Wimplicit-function-declaration]
                   if (unlikely(iov_iter_fault_in_readable(from, bytes))) {
                                ^
   1 error generated.


vim +/iov_iter_fault_in_readable +990 fs/ntfs3/file.c

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

--6TrnltStXW4iwmi0
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
9GuylpP6f6uRerRiyAEA
--6TrnltStXW4iwmi0--

