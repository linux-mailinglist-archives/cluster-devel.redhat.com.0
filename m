Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9C88328B0A3
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Oct 2020 10:53:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-pJxfO8wIPWuLVZu1Ggvsuw-1; Mon, 12 Oct 2020 04:53:18 -0400
X-MC-Unique: pJxfO8wIPWuLVZu1Ggvsuw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D073080F05A;
	Mon, 12 Oct 2020 08:53:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD522277C0;
	Mon, 12 Oct 2020 08:53:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A74849231F;
	Mon, 12 Oct 2020 08:53:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 099Jqiug020080 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Oct 2020 15:52:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 14B462166B28; Fri,  9 Oct 2020 19:52:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FB922166BA2
	for <cluster-devel@redhat.com>; Fri,  9 Oct 2020 19:52:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07F2D803532
	for <cluster-devel@redhat.com>; Fri,  9 Oct 2020 19:52:42 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-32-yXuYdrQ4NqOySfSyConLRQ-2; 
	Fri, 09 Oct 2020 15:52:30 -0400
X-MC-Unique: yXuYdrQ4NqOySfSyConLRQ-2
IronPort-SDR: 59yqvqvxbWzOZ8xolFJWN7q7tSNNcdQKuYiDRJnXGN27di9yReRCEUo9j7anXRuArPfCLfWrDz
	Kth3XN6aRauw==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="145397288"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="145397288"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	09 Oct 2020 12:51:24 -0700
IronPort-SDR: XjNk9w0mzDhi5BMigEI5d3C8W/iIq4vdRrLZr3Ki7urqpxKKtyqLLY7j1Bq5ukpJe/vk25ySpH
	cq+qGeUOhHow==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="355862741"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
	by orsmga007-auth.jf.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:51:22 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Date: Fri,  9 Oct 2020 12:49:45 -0700
Message-Id: <20201009195033.3208459-11-ira.weiny@intel.com>
In-Reply-To: <20201009195033.3208459-1-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 12 Oct 2020 04:53:05 -0400
Cc: linux-aio@kvack.org, linux-efi@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-mmc@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kselftest@vger.kernel.org, samba-technical@lists.samba.org,
	Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
	devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org,
	x86@kernel.org, amd-gfx@lists.freedesktop.org,
	linux-afs@lists.infradead.org, cluster-devel@redhat.com,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Doug Ledford <dledford@redhat.com>, linux-cachefs@redhat.com,
	intel-wired-lan@lists.osuosl.org,
	Bernard Metzler <bmt@zurich.ibm.com>, linux-ext4@vger.kernel.org,
	Fenghua Yu <fenghua.yu@intel.com>, Faisal Latif <faisal.latif@intel.com>,
	linux-um@lists.infradead.org, intel-gfx@lists.freedesktop.org,
	ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-nfs@vger.kernel.org, reiserfs-devel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
	xen-devel@lists.xenproject.org, drbd-dev@tron.linbit.com,
	Dan Williams <dan.j.williams@intel.com>,
	Shiraz Saleem <shiraz.saleem@intel.com>, io-uring@vger.kernel.org,
	Mike Marciniszyn <mike.marciniszyn@intel.com>,
	linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
	Dennis Dalessandro <dennis.dalessandro@intel.com>,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH RFC PKS/PMEM 10/58] drivers/rdma: Utilize
	new kmap_thread()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Ira Weiny <ira.weiny@intel.com>

The kmap() calls in these drivers are localized to a single thread.  To
avoid the over head of global PKRS updates use the new kmap_thread()
call.

Cc: Mike Marciniszyn <mike.marciniszyn@intel.com>
Cc: Dennis Dalessandro <dennis.dalessandro@intel.com>
Cc: Doug Ledford <dledford@redhat.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Faisal Latif <faisal.latif@intel.com>
Cc: Shiraz Saleem <shiraz.saleem@intel.com>
Cc: Bernard Metzler <bmt@zurich.ibm.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 drivers/infiniband/hw/hfi1/sdma.c      |  4 ++--
 drivers/infiniband/hw/i40iw/i40iw_cm.c | 10 +++++-----
 drivers/infiniband/sw/siw/siw_qp_tx.c  | 14 +++++++-------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/infiniband/hw/hfi1/sdma.c b/drivers/infiniband/hw/hfi1/sdma.c
index 04575c9afd61..09d206e3229a 100644
--- a/drivers/infiniband/hw/hfi1/sdma.c
+++ b/drivers/infiniband/hw/hfi1/sdma.c
@@ -3130,7 +3130,7 @@ int ext_coal_sdma_tx_descs(struct hfi1_devdata *dd, struct sdma_txreq *tx,
 		}
 
 		if (type == SDMA_MAP_PAGE) {
-			kvaddr = kmap(page);
+			kvaddr = kmap_thread(page);
 			kvaddr += offset;
 		} else if (WARN_ON(!kvaddr)) {
 			__sdma_txclean(dd, tx);
@@ -3140,7 +3140,7 @@ int ext_coal_sdma_tx_descs(struct hfi1_devdata *dd, struct sdma_txreq *tx,
 		memcpy(tx->coalesce_buf + tx->coalesce_idx, kvaddr, len);
 		tx->coalesce_idx += len;
 		if (type == SDMA_MAP_PAGE)
-			kunmap(page);
+			kunmap_thread(page);
 
 		/* If there is more data, return */
 		if (tx->tlen - tx->coalesce_idx)
diff --git a/drivers/infiniband/hw/i40iw/i40iw_cm.c b/drivers/infiniband/hw/i40iw/i40iw_cm.c
index a3b95805c154..122d7a5642a1 100644
--- a/drivers/infiniband/hw/i40iw/i40iw_cm.c
+++ b/drivers/infiniband/hw/i40iw/i40iw_cm.c
@@ -3721,7 +3721,7 @@ int i40iw_accept(struct iw_cm_id *cm_id, struct iw_cm_conn_param *conn_param)
 		ibmr->device = iwpd->ibpd.device;
 		iwqp->lsmm_mr = ibmr;
 		if (iwqp->page)
-			iwqp->sc_qp.qp_uk.sq_base = kmap(iwqp->page);
+			iwqp->sc_qp.qp_uk.sq_base = kmap_thread(iwqp->page);
 		dev->iw_priv_qp_ops->qp_send_lsmm(&iwqp->sc_qp,
 							iwqp->ietf_mem.va,
 							(accept.size + conn_param->private_data_len),
@@ -3729,12 +3729,12 @@ int i40iw_accept(struct iw_cm_id *cm_id, struct iw_cm_conn_param *conn_param)
 
 	} else {
 		if (iwqp->page)
-			iwqp->sc_qp.qp_uk.sq_base = kmap(iwqp->page);
+			iwqp->sc_qp.qp_uk.sq_base = kmap_thread(iwqp->page);
 		dev->iw_priv_qp_ops->qp_send_lsmm(&iwqp->sc_qp, NULL, 0, 0);
 	}
 
 	if (iwqp->page)
-		kunmap(iwqp->page);
+		kunmap_thread(iwqp->page);
 
 	iwqp->cm_id = cm_id;
 	cm_node->cm_id = cm_id;
@@ -4102,10 +4102,10 @@ static void i40iw_cm_event_connected(struct i40iw_cm_event *event)
 	i40iw_cm_init_tsa_conn(iwqp, cm_node);
 	read0 = (cm_node->send_rdma0_op == SEND_RDMA_READ_ZERO);
 	if (iwqp->page)
-		iwqp->sc_qp.qp_uk.sq_base = kmap(iwqp->page);
+		iwqp->sc_qp.qp_uk.sq_base = kmap_thread(iwqp->page);
 	dev->iw_priv_qp_ops->qp_send_rtt(&iwqp->sc_qp, read0);
 	if (iwqp->page)
-		kunmap(iwqp->page);
+		kunmap_thread(iwqp->page);
 
 	memset(&attr, 0, sizeof(attr));
 	attr.qp_state = IB_QPS_RTS;
diff --git a/drivers/infiniband/sw/siw/siw_qp_tx.c b/drivers/infiniband/sw/siw/siw_qp_tx.c
index d19d8325588b..4ed37c328d02 100644
--- a/drivers/infiniband/sw/siw/siw_qp_tx.c
+++ b/drivers/infiniband/sw/siw/siw_qp_tx.c
@@ -76,7 +76,7 @@ static int siw_try_1seg(struct siw_iwarp_tx *c_tx, void *paddr)
 			if (unlikely(!p))
 				return -EFAULT;
 
-			buffer = kmap(p);
+			buffer = kmap_thread(p);
 
 			if (likely(PAGE_SIZE - off >= bytes)) {
 				memcpy(paddr, buffer + off, bytes);
@@ -84,7 +84,7 @@ static int siw_try_1seg(struct siw_iwarp_tx *c_tx, void *paddr)
 				unsigned long part = bytes - (PAGE_SIZE - off);
 
 				memcpy(paddr, buffer + off, part);
-				kunmap(p);
+				kunmap_thread(p);
 
 				if (!mem->is_pbl)
 					p = siw_get_upage(mem->umem,
@@ -96,10 +96,10 @@ static int siw_try_1seg(struct siw_iwarp_tx *c_tx, void *paddr)
 				if (unlikely(!p))
 					return -EFAULT;
 
-				buffer = kmap(p);
+				buffer = kmap_thread(p);
 				memcpy(paddr + part, buffer, bytes - part);
 			}
-			kunmap(p);
+			kunmap_thread(p);
 		}
 	}
 	return (int)bytes;
@@ -505,7 +505,7 @@ static int siw_tx_hdt(struct siw_iwarp_tx *c_tx, struct socket *s)
 				page_array[seg] = p;
 
 				if (!c_tx->use_sendpage) {
-					iov[seg].iov_base = kmap(p) + fp_off;
+					iov[seg].iov_base = kmap_thread(p) + fp_off;
 					iov[seg].iov_len = plen;
 
 					/* Remember for later kunmap() */
@@ -518,9 +518,9 @@ static int siw_tx_hdt(struct siw_iwarp_tx *c_tx, struct socket *s)
 							plen);
 				} else if (do_crc) {
 					crypto_shash_update(c_tx->mpa_crc_hd,
-							    kmap(p) + fp_off,
+							    kmap_thread(p) + fp_off,
 							    plen);
-					kunmap(p);
+					kunmap_thread(p);
 				}
 			} else {
 				u64 va = sge->laddr + sge_off;
-- 
2.28.0.rc0.12.gb6a658bd00c9

