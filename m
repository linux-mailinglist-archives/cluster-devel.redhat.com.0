Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 580D628BE4A
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Oct 2020 18:45:05 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-ATWrtAAZO8qNddPKbBDEPA-1; Mon, 12 Oct 2020 12:45:01 -0400
X-MC-Unique: ATWrtAAZO8qNddPKbBDEPA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 097D2107B467;
	Mon, 12 Oct 2020 16:44:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A65455D9D2;
	Mon, 12 Oct 2020 16:44:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A4E919730F;
	Mon, 12 Oct 2020 16:44:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09CGisoh024444 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 12 Oct 2020 12:44:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1D9E02166BCC; Mon, 12 Oct 2020 16:44:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1881D2166BA4
	for <cluster-devel@redhat.com>; Mon, 12 Oct 2020 16:44:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0EECA858289
	for <cluster-devel@redhat.com>; Mon, 12 Oct 2020 16:44:52 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-311-p2SRenf0Niu1PDeJZHAWFw-1; Mon, 12 Oct 2020 12:44:50 -0400
X-MC-Unique: p2SRenf0Niu1PDeJZHAWFw-1
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1kS0wA-0004gO-8Q; Mon, 12 Oct 2020 16:44:38 +0000
Date: Mon, 12 Oct 2020 17:44:38 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Dave Hansen <dave.hansen@intel.com>
Message-ID: <20201012164438.GA20115@casper.infradead.org>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
	<20201009195033.3208459-23-ira.weiny@intel.com>
	<20201009213434.GA839@sol.localdomain>
	<20201010003954.GW20115@casper.infradead.org>
	<20201010013036.GD1122@sol.localdomain>
	<20201012065635.GB2046448@iweiny-DESK2.sc.intel.com>
	<20201012161946.GA858@sol.localdomain>
	<5d621db9-23d4-e140-45eb-d7fca2093d2b@intel.com>
MIME-Version: 1.0
In-Reply-To: <5d621db9-23d4-e140-45eb-d7fca2093d2b@intel.com>
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
Cc: linux-aio@kvack.org, linux-efi@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	linux-mmc@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	Ira Weiny <ira.weiny@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, devel@driverdev.osuosl.org,
	linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-nvdimm@lists.01.org,
	linux-rdma@vger.kernel.org, x86@kernel.org,
	amd-gfx@lists.freedesktop.org, linux-afs@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, intel-wired-lan@lists.osuosl.org,
	kexec@lists.infradead.org, xen-devel@lists.xenproject.org,
	linux-ext4@vger.kernel.org, bpf@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>, Fenghua Yu <fenghua.yu@intel.com>,
	intel-gfx@lists.freedesktop.org, ecryptfs@vger.kernel.org,
	linux-um@lists.infradead.org, reiserfs-devel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
	Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>, drbd-dev@tron.linbit.com,
	Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
	io-uring@vger.kernel.org, linux-cachefs@redhat.com,
	linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
	netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
	cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH RFC PKS/PMEM 22/58] fs/f2fs: Utilize new
	kmap_thread()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 12, 2020 at 09:28:29AM -0700, Dave Hansen wrote:
> kmap_atomic() is always preferred over kmap()/kmap_thread().
> kmap_atomic() is _much_ more lightweight since its TLB invalidation is
> always CPU-local and never broadcast.
> 
> So, basically, unless you *must* sleep while the mapping is in place,
> kmap_atomic() is preferred.

But kmap_atomic() disables preemption, so the _ideal_ interface would map
it only locally, then on preemption make it global.  I don't even know
if that _can_ be done.  But this email makes it seem like kmap_atomic()
has no downsides.

