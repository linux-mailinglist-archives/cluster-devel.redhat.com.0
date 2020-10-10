Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 888E728B0D5
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Oct 2020 10:53:28 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-8wFLJeDcOg6tuVAfDWiZGA-1; Mon, 12 Oct 2020 04:53:25 -0400
X-MC-Unique: 8wFLJeDcOg6tuVAfDWiZGA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 840AE18A0F3F;
	Mon, 12 Oct 2020 08:53:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 721BF60C07;
	Mon, 12 Oct 2020 08:53:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5F5B29A04F;
	Mon, 12 Oct 2020 08:53:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09ABb4s7025636 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 10 Oct 2020 07:37:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B99321227754; Sat, 10 Oct 2020 11:37:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3B251140591
	for <cluster-devel@redhat.com>; Sat, 10 Oct 2020 11:37:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66039800186
	for <cluster-devel@redhat.com>; Sat, 10 Oct 2020 11:37:00 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-397-8ZUdO_bnPP-jdcFb2jAoTA-1; Sat, 10 Oct 2020 07:36:57 -0400
X-MC-Unique: 8ZUdO_bnPP-jdcFb2jAoTA-1
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	09ABWCGY027935
	for <cluster-devel@redhat.com>; Sat, 10 Oct 2020 07:36:56 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
	[192.155.248.91])
	by mx0a-001b2d01.pphosted.com with ESMTP id 343bvn8apm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT)
	for <cluster-devel@redhat.com>; Sat, 10 Oct 2020 07:36:56 -0400
Received: from localhost
	by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
	for <cluster-devel@redhat.com> from <BMT@zurich.ibm.com>;
	Sat, 10 Oct 2020 11:36:55 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
	by smtp.notes.na.collabserv.com (10.106.227.143) with
	smtp.notes.na.collabserv.com ESMTP; Sat, 10 Oct 2020 11:36:50 -0000
Received: from us1a3-mail162.a3.dal06.isc4sb.com ([10.146.71.4])
	by us1a3-smtp05.a3.dal06.isc4sb.com
	with ESMTP id 2020101011364991-175970 ;
	Sat, 10 Oct 2020 11:36:49 +0000
In-Reply-To: <20201009195033.3208459-11-ira.weiny@intel.com>
From: "Bernard Metzler" <BMT@zurich.ibm.com>
To: ira.weiny@intel.com
Date: Sat, 10 Oct 2020 11:36:49 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <20201009195033.3208459-11-ira.weiny@intel.com>,
	<20201009195033.3208459-1-ira.weiny@intel.com>
X-LLNOutbound: False
X-Disclaimed: 59823
X-TNEFEvaluated: 1
x-cbid: 20101011-2475-0000-0000-0000044A0339
X-IBM-SpamModules-Scores: BY=0.233045; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
	SC=0.421684; ST=0; TS=0; UL=0; ISC=; MB=0.000000
X-IBM-SpamModules-Versions: BY=3.00013982; HX=3.00000242; KW=3.00000007;
	PH=3.00000004; SC=3.00000295; SDB=6.01447073; UDB=6.00777937;
	IPR=6.01229775; 
	MB=3.00034472; MTD=3.00000008; XFM=3.00000015; UTC=2020-10-10 11:36:54
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-10-10 06:57:40 - 6.00011937
x-cbparentid: 20101011-2476-0000-0000-0000DAA5035B
Message-Id: <OF849D92D8.F4735ECA-ON002585FD.003F5F27-002585FD.003FCBD6@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
	definitions=2020-10-10_07:2020-10-09,
	2020-10-10 signatures=0
X-Proofpoint-Spam-Reason: orgsafe
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 09ABb4s7025636
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 12 Oct 2020 04:53:05 -0400
Cc: linux-aio@kvack.org, linux-efi@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	linux-mmc@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kselftest@vger.kernel.org, samba-technical@lists.samba.org,
	Thomas Gleixner <tglx@linutronix.de>, devel@driverdev.osuosl.org,
	linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-nvdimm@lists.01.org,
	linux-rdma@vger.kernel.org, x86@kernel.org,
	ceph-devel@vger.kernel.org, io-uring@vger.kernel.org,
	cluster-devel@redhat.com, Jason
	Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>,
	Ingo Molnar <mingo@redhat.com>, intel-wired-lan@lists.osuosl.org,
	xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
	Fenghua Yu <fenghua.yu@intel.com>, linux-afs@lists.infradead.org,
	Faisal Latif <faisal.latif@intel.com>,
	linux-um@lists.infradead.org, intel-gfx@lists.freedesktop.org,
	ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-nfs@vger.kernel.org, reiserfs-devel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
	Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>, drbd-dev@tron.linbit.com,
	amd-gfx@lists.freed.esktop.org,
	Dan Williams <dan.j.williams@intel.com>, Shiraz
	Saleem <shiraz.saleem@intel.com>, bpf@vger.kernel.org,
	linux-cachefs@redhat.com, Mike Marciniszyn <mike.marciniszyn@intel.com>,
	linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
	Dennis Dalessandro <dennis.dalessandro@intel.com>,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH RFC PKS/PMEM 10/58] drivers/rdma:
	Utilize new kmap_thread()
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----ira.weiny@intel.com wrote: -----

>To: "Andrew Morton" <akpm@linux-foundation.org>, "Thomas Gleixner"
><tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>, "Borislav
>Petkov" <bp@alien8.de>, "Andy Lutomirski" <luto@kernel.org>, "Peter
>Zijlstra" <peterz@infradead.org>
>From: ira.weiny@intel.com
>Date: 10/09/2020 09:52PM
>Cc: "Ira Weiny" <ira.weiny@intel.com>, "Mike Marciniszyn"
><mike.marciniszyn@intel.com>, "Dennis Dalessandro"
><dennis.dalessandro@intel.com>, "Doug Ledford" <dledford@redhat.com>,
>"Jason Gunthorpe" <jgg@ziepe.ca>, "Faisal Latif"
><faisal.latif@intel.com>, "Shiraz Saleem" <shiraz.saleem@intel.com>,
>"Bernard Metzler" <bmt@zurich.ibm.com>, x86@kernel.org, "Dave Hansen"
><dave.hansen@linux.intel.com>, "Dan Williams"
><dan.j.williams@intel.com>, "Fenghua Yu" <fenghua.yu@intel.com>,
>linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
>linux-nvdimm@lists.01.org, linux-fsdevel@vger.kernel.org,
>linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
>linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
>netdev@vger.kernel.org, bpf@vger.kernel.org,
>kexec@lists.infradead.org, linux-bcache@vger.kernel.org,
>linux-mtd@lists.infradead.org, devel@driverdev.osuosl.org,
>linux-efi@vger.kernel.org, linux-mmc@vger.kernel.org,
>linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
>linux-nfs@vger.kernel.org, ceph-devel@vger.kernel.org,
>linux-ext4@vger.kernel.org, linux-aio@kvack.org,
>io-uring@vger.kernel.org, linux-erofs@lists.ozlabs.org,
>linux-um@lists.infradead.org, linux-ntfs-dev@lists.sourceforge.net,
>reiserfs-devel@vger.kernel.org,
>linux-f2fs-devel@lists.sourceforge.net, linux-nilfs@vger.kernel.org,
>cluster-devel@redhat.com, ecryptfs@vger.kernel.org,
>linux-cifs@vger.kernel.org, linux-btrfs@vger.kernel.org,
>linux-afs@lists.infradead.org, linux-rdma@vger.kernel.org,
>amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
>intel-gfx@lists.freedesktop.org, drbd-dev@tron.linbit.com,
>linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
>linux-cachefs@redhat.com, samba-technical@lists.samba.org,
>intel-wired-lan@lists.osuosl.org
>Subject: [EXTERNAL] [PATCH RFC PKS/PMEM 10/58] drivers/rdma: Utilize
>new kmap_thread()
>
>From: Ira Weiny <ira.weiny@intel.com>
>
>The kmap() calls in these drivers are localized to a single thread.
>To
>avoid the over head of global PKRS updates use the new kmap_thread()
>call.
>
>Cc: Mike Marciniszyn <mike.marciniszyn@intel.com>
>Cc: Dennis Dalessandro <dennis.dalessandro@intel.com>
>Cc: Doug Ledford <dledford@redhat.com>
>Cc: Jason Gunthorpe <jgg@ziepe.ca>
>Cc: Faisal Latif <faisal.latif@intel.com>
>Cc: Shiraz Saleem <shiraz.saleem@intel.com>
>Cc: Bernard Metzler <bmt@zurich.ibm.com>
>Signed-off-by: Ira Weiny <ira.weiny@intel.com>
>---
> drivers/infiniband/hw/hfi1/sdma.c      |  4 ++--
> drivers/infiniband/hw/i40iw/i40iw_cm.c | 10 +++++-----
> drivers/infiniband/sw/siw/siw_qp_tx.c  | 14 +++++++-------
> 3 files changed, 14 insertions(+), 14 deletions(-)
>
>diff --git a/drivers/infiniband/hw/hfi1/sdma.c
>b/drivers/infiniband/hw/hfi1/sdma.c
>index 04575c9afd61..09d206e3229a 100644
>--- a/drivers/infiniband/hw/hfi1/sdma.c
>+++ b/drivers/infiniband/hw/hfi1/sdma.c
>@@ -3130,7 +3130,7 @@ int ext_coal_sdma_tx_descs(struct hfi1_devdata
>*dd, struct sdma_txreq *tx,
> 		}
> 
> 		if (type == SDMA_MAP_PAGE) {
>-			kvaddr = kmap(page);
>+			kvaddr = kmap_thread(page);
> 			kvaddr += offset;
> 		} else if (WARN_ON(!kvaddr)) {
> 			__sdma_txclean(dd, tx);
>@@ -3140,7 +3140,7 @@ int ext_coal_sdma_tx_descs(struct hfi1_devdata
>*dd, struct sdma_txreq *tx,
> 		memcpy(tx->coalesce_buf + tx->coalesce_idx, kvaddr, len);
> 		tx->coalesce_idx += len;
> 		if (type == SDMA_MAP_PAGE)
>-			kunmap(page);
>+			kunmap_thread(page);
> 
> 		/* If there is more data, return */
> 		if (tx->tlen - tx->coalesce_idx)
>diff --git a/drivers/infiniband/hw/i40iw/i40iw_cm.c
>b/drivers/infiniband/hw/i40iw/i40iw_cm.c
>index a3b95805c154..122d7a5642a1 100644
>--- a/drivers/infiniband/hw/i40iw/i40iw_cm.c
>+++ b/drivers/infiniband/hw/i40iw/i40iw_cm.c
>@@ -3721,7 +3721,7 @@ int i40iw_accept(struct iw_cm_id *cm_id, struct
>iw_cm_conn_param *conn_param)
> 		ibmr->device = iwpd->ibpd.device;
> 		iwqp->lsmm_mr = ibmr;
> 		if (iwqp->page)
>-			iwqp->sc_qp.qp_uk.sq_base = kmap(iwqp->page);
>+			iwqp->sc_qp.qp_uk.sq_base = kmap_thread(iwqp->page);
> 		dev->iw_priv_qp_ops->qp_send_lsmm(&iwqp->sc_qp,
> 							iwqp->ietf_mem.va,
> 							(accept.size + conn_param->private_data_len),
>@@ -3729,12 +3729,12 @@ int i40iw_accept(struct iw_cm_id *cm_id,
>struct iw_cm_conn_param *conn_param)
> 
> 	} else {
> 		if (iwqp->page)
>-			iwqp->sc_qp.qp_uk.sq_base = kmap(iwqp->page);
>+			iwqp->sc_qp.qp_uk.sq_base = kmap_thread(iwqp->page);
> 		dev->iw_priv_qp_ops->qp_send_lsmm(&iwqp->sc_qp, NULL, 0, 0);
> 	}
> 
> 	if (iwqp->page)
>-		kunmap(iwqp->page);
>+		kunmap_thread(iwqp->page);
> 
> 	iwqp->cm_id = cm_id;
> 	cm_node->cm_id = cm_id;
>@@ -4102,10 +4102,10 @@ static void i40iw_cm_event_connected(struct
>i40iw_cm_event *event)
> 	i40iw_cm_init_tsa_conn(iwqp, cm_node);
> 	read0 = (cm_node->send_rdma0_op == SEND_RDMA_READ_ZERO);
> 	if (iwqp->page)
>-		iwqp->sc_qp.qp_uk.sq_base = kmap(iwqp->page);
>+		iwqp->sc_qp.qp_uk.sq_base = kmap_thread(iwqp->page);
> 	dev->iw_priv_qp_ops->qp_send_rtt(&iwqp->sc_qp, read0);
> 	if (iwqp->page)
>-		kunmap(iwqp->page);
>+		kunmap_thread(iwqp->page);
> 
> 	memset(&attr, 0, sizeof(attr));
> 	attr.qp_state = IB_QPS_RTS;
>diff --git a/drivers/infiniband/sw/siw/siw_qp_tx.c
>b/drivers/infiniband/sw/siw/siw_qp_tx.c
>index d19d8325588b..4ed37c328d02 100644
>--- a/drivers/infiniband/sw/siw/siw_qp_tx.c
>+++ b/drivers/infiniband/sw/siw/siw_qp_tx.c
>@@ -76,7 +76,7 @@ static int siw_try_1seg(struct siw_iwarp_tx *c_tx,
>void *paddr)
> 			if (unlikely(!p))
> 				return -EFAULT;
> 
>-			buffer = kmap(p);
>+			buffer = kmap_thread(p);
> 
> 			if (likely(PAGE_SIZE - off >= bytes)) {
> 				memcpy(paddr, buffer + off, bytes);
>@@ -84,7 +84,7 @@ static int siw_try_1seg(struct siw_iwarp_tx *c_tx,
>void *paddr)
> 				unsigned long part = bytes - (PAGE_SIZE - off);
> 
> 				memcpy(paddr, buffer + off, part);
>-				kunmap(p);
>+				kunmap_thread(p);
> 
> 				if (!mem->is_pbl)
> 					p = siw_get_upage(mem->umem,
>@@ -96,10 +96,10 @@ static int siw_try_1seg(struct siw_iwarp_tx
>*c_tx, void *paddr)
> 				if (unlikely(!p))
> 					return -EFAULT;
> 
>-				buffer = kmap(p);
>+				buffer = kmap_thread(p);
> 				memcpy(paddr + part, buffer, bytes - part);
> 			}
>-			kunmap(p);
>+			kunmap_thread(p);
> 		}
> 	}
> 	return (int)bytes;
>@@ -505,7 +505,7 @@ static int siw_tx_hdt(struct siw_iwarp_tx *c_tx,
>struct socket *s)
> 				page_array[seg] = p;
> 
> 				if (!c_tx->use_sendpage) {
>-					iov[seg].iov_base = kmap(p) + fp_off;
>+					iov[seg].iov_base = kmap_thread(p) + fp_off;

This misses a corresponding kunmap_thread() in siw_unmap_pages()
(pls change line 403 in siw_qp_tx.c as well)

Thanks,
Bernard.

> 					iov[seg].iov_len = plen;
> 
> 					/* Remember for later kunmap() */
>@@ -518,9 +518,9 @@ static int siw_tx_hdt(struct siw_iwarp_tx *c_tx,
>struct socket *s)
> 							plen);
> 				} else if (do_crc) {
> 					crypto_shash_update(c_tx->mpa_crc_hd,
>-							    kmap(p) + fp_off,
>+							    kmap_thread(p) + fp_off,
> 							    plen);
>-					kunmap(p);
>+					kunmap_thread(p);
> 				}
> 			} else {
> 				u64 va = sge->laddr + sge_off;
>-- 
>2.28.0.rc0.12.gb6a658bd00c9
>
>


