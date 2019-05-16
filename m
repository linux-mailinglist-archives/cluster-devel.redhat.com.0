Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 418131FE96
	for <lists+cluster-devel@lfdr.de>; Thu, 16 May 2019 06:45:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7A24D3082A8F;
	Thu, 16 May 2019 04:45:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DD7C60E39;
	Thu, 16 May 2019 04:45:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 031BF54D3D;
	Thu, 16 May 2019 04:45:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4G4jTAx003724 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 16 May 2019 00:45:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 734E61C94D; Thu, 16 May 2019 04:45:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C56F19732;
	Thu, 16 May 2019 04:45:27 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D31BC30C1B8F;
	Thu, 16 May 2019 04:45:25 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 May 2019 21:45:25 -0700
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
	by fmsmga008.fm.intel.com with ESMTP; 15 May 2019 21:45:24 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
	(envelope-from <lkp@intel.com>)
	id 1hR8Gi-0007tK-71; Thu, 16 May 2019 12:45:24 +0800
Date: Thu, 16 May 2019 12:45:15 +0800
From: kbuild test robot <lkp@intel.com>
To: Bob Peterson <rpeterso@redhat.com>
Message-ID: <201905161213.PtKPTvS9%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.43]); Thu, 16 May 2019 04:45:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Thu, 16 May 2019 04:45:26 +0000 (UTC) for IP:'192.55.52.115'
	DOMAIN:'mga14.intel.com' HELO:'mga14.intel.com'
	FROM:'lkp@intel.com' RCPT:''
X-RedHat-Spam-Score: -5.001  (RCVD_IN_DNSWL_HI,
	SPF_PASS) 192.55.52.115 mga14.intel.com 192.55.52.115
	mga14.intel.com <lkp@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, kbuild-all@01.org
Subject: [Cluster-devel] [gfs2:for-next.recovery6o 11/25]
 fs/gfs2/lops.c:215:22: sparse: sparse: incorrect type in initializer
 (different base types)
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Thu, 16 May 2019 04:45:38 +0000 (UTC)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git for-next.recovery6o
head:   1b7696df0c689a9c6610ebd1f1a5f5353c228ba5
commit: 846ea61cee4947e91765afe2df90bdd9f9913349 [11/25] gfs2: Only complain the first time an io error occurs in quota or log
reproduce:
        # apt-get install sparse
        git checkout 846ea61cee4947e91765afe2df90bdd9f9913349
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> fs/gfs2/lops.c:215:22: sparse: sparse: incorrect type in initializer (different base types) @@    expected int __new @@    got restricted blk_status_t [usertyint __new @@
>> fs/gfs2/lops.c:215:22: sparse:    expected int __new
>> fs/gfs2/lops.c:215:22: sparse:    got restricted blk_status_t [usertype] bi_status

vim +215 fs/gfs2/lops.c

   195	
   196	/**
   197	 * gfs2_end_log_write - end of i/o to the log
   198	 * @bio: The bio
   199	 *
   200	 * Each bio_vec contains either data from the pagecache or data
   201	 * relating to the log itself. Here we iterate over the bio_vec
   202	 * array, processing both kinds of data.
   203	 *
   204	 */
   205	
   206	static void gfs2_end_log_write(struct bio *bio)
   207	{
   208		struct gfs2_sbd *sdp = bio->bi_private;
   209		struct bio_vec *bvec;
   210		struct page *page;
   211		int i;
   212		struct bvec_iter_all iter_all;
   213	
   214		if (bio->bi_status) {
 > 215			if (!cmpxchg(&sdp->sd_log_error, 0, bio->bi_status))
   216				fs_err(sdp, "Error %d writing to journal, jid=%u\n",
   217				       bio->bi_status, sdp->sd_jdesc->jd_jid);
   218			wake_up(&sdp->sd_logd_waitq);
   219		}
   220	
   221		bio_for_each_segment_all(bvec, bio, i, iter_all) {
   222			page = bvec->bv_page;
   223			if (page_has_buffers(page))
   224				gfs2_end_log_write_bh(sdp, bvec, bio->bi_status);
   225			else
   226				mempool_free(page, gfs2_page_pool);
   227		}
   228	
   229		bio_put(bio);
   230		if (atomic_dec_and_test(&sdp->sd_log_in_flight))
   231			wake_up(&sdp->sd_log_flush_wait);
   232	}
   233	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

