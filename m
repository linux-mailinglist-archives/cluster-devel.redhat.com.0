Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 78A7C28B0BF
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Oct 2020 10:53:26 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-vJtpcyHdO2SWvNDyhoZmAg-1; Mon, 12 Oct 2020 04:53:24 -0400
X-MC-Unique: vJtpcyHdO2SWvNDyhoZmAg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B03A8802B72;
	Mon, 12 Oct 2020 08:53:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DFE65C22B;
	Mon, 12 Oct 2020 08:53:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8B09C9A04E;
	Mon, 12 Oct 2020 08:53:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09C4mB9J004168 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 12 Oct 2020 00:48:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E2C412166BCC; Mon, 12 Oct 2020 04:48:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DEBF72166BA3
	for <cluster-devel@redhat.com>; Mon, 12 Oct 2020 04:48:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE039800296
	for <cluster-devel@redhat.com>; Mon, 12 Oct 2020 04:48:08 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-8-OguDmzsXPGuyS9uKFin1Xw-1; Mon, 12 Oct 2020 00:48:03 -0400
X-MC-Unique: OguDmzsXPGuyS9uKFin1Xw-1
IronPort-SDR: GZ+YB5FHdCt0HhMdcWj5CCj76FxISb49QDvc+VNNFNOdThE8MWSI+EwWfXwXmU6MpkjRJ24Py4
	GAv0GYPDAY9g==
X-IronPort-AV: E=McAfee;i="6000,8403,9771"; a="165802063"
X-IronPort-AV: E=Sophos;i="5.77,365,1596524400"; d="scan'208";a="165802063"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	11 Oct 2020 21:47:58 -0700
IronPort-SDR: OeJlrvjJIthwDW5ZiLkp+F246Fw9BWID0JMdXYyjjISLX5UipnPYleFarWgQdoLnt1ZOhIB0kv
	QrFucSf/AAcw==
X-IronPort-AV: E=Sophos;i="5.77,365,1596524400"; d="scan'208";a="529805779"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
	by orsmga005-auth.jf.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2020 21:47:57 -0700
Date: Sun, 11 Oct 2020 21:47:56 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Bernard Metzler <BMT@zurich.ibm.com>
Message-ID: <20201012044756.GY2046448@iweiny-DESK2.sc.intel.com>
References: <20201009195033.3208459-11-ira.weiny@intel.com>
	<20201009195033.3208459-1-ira.weiny@intel.com>
	<OF849D92D8.F4735ECA-ON002585FD.003F5F27-002585FD.003FCBD6@notes.na.collabserv.com>
MIME-Version: 1.0
In-Reply-To: <OF849D92D8.F4735ECA-ON002585FD.003F5F27-002585FD.003FCBD6@notes.na.collabserv.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
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
	cluster-devel@redhat.com, Jason Gunthorpe <jgg@ziepe.ca>,
	Doug Ledford <dledford@redhat.com>,
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
	amd-gfx@lists.freed.esktop.org, Dan Williams <dan.j.williams@intel.com>,
	Shiraz Saleem <shiraz.saleem@intel.com>, bpf@vger.kernel.org,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 10, 2020 at 11:36:49AM +0000, Bernard Metzler wrote:
> -----ira.weiny@intel.com wrote: -----
> 

[snip]

> >@@ -505,7 +505,7 @@ static int siw_tx_hdt(struct siw_iwarp_tx *c_tx,
> >struct socket *s)
> > 				page_array[seg] = p;
> > 
> > 				if (!c_tx->use_sendpage) {
> >-					iov[seg].iov_base = kmap(p) + fp_off;
> >+					iov[seg].iov_base = kmap_thread(p) + fp_off;
> 
> This misses a corresponding kunmap_thread() in siw_unmap_pages()
> (pls change line 403 in siw_qp_tx.c as well)

Thanks I missed that.

Done.

Ira

> 
> Thanks,
> Bernard.
> 

