Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6F7F428D5CD
	for <lists+cluster-devel@lfdr.de>; Tue, 13 Oct 2020 22:50:33 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-IdGn9AbhNLat4EdaftrUdQ-1; Tue, 13 Oct 2020 16:50:30 -0400
X-MC-Unique: IdGn9AbhNLat4EdaftrUdQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1019118B6424;
	Tue, 13 Oct 2020 20:50:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A10D955778;
	Tue, 13 Oct 2020 20:50:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 291711832FB6;
	Tue, 13 Oct 2020 20:50:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09DKoO3H004177 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 13 Oct 2020 16:50:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 48AC32EBC47; Tue, 13 Oct 2020 20:50:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 435EA2EBC53
	for <cluster-devel@redhat.com>; Tue, 13 Oct 2020 20:50:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26A811823612
	for <cluster-devel@redhat.com>; Tue, 13 Oct 2020 20:50:21 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-327-fYCo00AWP6CQJEcbZOJAWw-1; Tue, 13 Oct 2020 16:50:16 -0400
X-MC-Unique: fYCo00AWP6CQJEcbZOJAWw-1
IronPort-SDR: UoGOVmKkTtbPLLnws8wObIAZWBL5f72scHqra4qK4khwoxRiDpwLtJJplNQrIMix00Tv7SFJMb
	+H63IhuW1rqw==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="230161646"
X-IronPort-AV: E=Sophos;i="5.77,371,1596524400"; d="scan'208";a="230161646"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	13 Oct 2020 13:50:14 -0700
IronPort-SDR: tBU8Od+WgzKnoE84+DWDWPkln+je7r0O2Nptsn2TVKPsgnriflj5gQkH1GYPWlpzBZ1iqAqtCk
	/srhQcj0pjbQ==
X-IronPort-AV: E=Sophos;i="5.77,371,1596524400"; d="scan'208";a="318439699"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
	by orsmga006-auth.jf.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2020 13:50:12 -0700
Date: Tue, 13 Oct 2020 13:50:12 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Message-ID: <20201013205012.GI2046448@iweiny-DESK2.sc.intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
	<20201009195033.3208459-34-ira.weiny@intel.com>
	<CAPcyv4gL3jfw4d+SJGPqAD3Dp4F_K=X3domuN4ndAA1FQDGcPg@mail.gmail.com>
	<20201013193643.GK20115@casper.infradead.org>
	<20201013200149.GI3576660@ZenIV.linux.org.uk>
MIME-Version: 1.0
In-Reply-To: <20201013200149.GI3576660@ZenIV.linux.org.uk>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: linux-aio@kvack.org, linux-efi <linux-efi@vger.kernel.org>,
	KVM list <kvm@vger.kernel.org>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, linux-mmc@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
	Linux MM <linux-mm@kvack.org>, target-devel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	amd-gfx list <amd-gfx@lists.freedesktop.org>,
	linux-kselftest@vger.kernel.org, samba-technical@lists.samba.org,
	Thomas Gleixner <tglx@linutronix.de>, devel@driverdev.osuosl.org,
	linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-scsi <linux-scsi@vger.kernel.org>,
	linux-nvdimm <linux-nvdimm@lists.01.org>,
	linux-rdma <linux-rdma@vger.kernel.org>, X86 ML <x86@kernel.org>,
	ceph-devel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	io-uring@vger.kernel.org, cluster-devel@redhat.com,
	Ingo Molnar <mingo@redhat.com>, intel-wired-lan@lists.osuosl.org,
	xen-devel <xen-devel@lists.xenproject.org>,
	linux-ext4 <linux-ext4@vger.kernel.org>,
	Fenghua Yu <fenghua.yu@intel.com>, linux-afs@lists.infradead.org,
	linux-um@lists.infradead.org, intel-gfx@lists.freedesktop.org,
	ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-bcache@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>, drbd-dev@tron.linbit.com,
	Dan Williams <dan.j.williams@intel.com>, bpf@vger.kernel.org,
	linux-cachefs@redhat.com, linux-nfs@vger.kernel.org,
	Nicolas Pitre <nico@fluxnic.net>, linux-ntfs-dev@lists.sourceforge.net,
	Netdev <netdev@vger.kernel.org>,
	Kexec Mailing List <kexec@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	linux-btrfs <linux-btrfs@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH RFC PKS/PMEM 33/58] fs/cramfs: Utilize
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 13, 2020 at 09:01:49PM +0100, Al Viro wrote:
> On Tue, Oct 13, 2020 at 08:36:43PM +0100, Matthew Wilcox wrote:
> 
> > static inline void copy_to_highpage(struct page *to, void *vfrom, unsigned int size)
> > {
> > 	char *vto = kmap_atomic(to);
> > 
> > 	memcpy(vto, vfrom, size);
> > 	kunmap_atomic(vto);
> > }
> > 
> > in linux/highmem.h ?
> 
> You mean, like
> static void memcpy_from_page(char *to, struct page *page, size_t offset, size_t len)
> {
>         char *from = kmap_atomic(page);
>         memcpy(to, from + offset, len);
>         kunmap_atomic(from);
> }
> 
> static void memcpy_to_page(struct page *page, size_t offset, const char *from, size_t len)
> {
>         char *to = kmap_atomic(page);
>         memcpy(to + offset, from, len);
>         kunmap_atomic(to);
> }
> 
> static void memzero_page(struct page *page, size_t offset, size_t len)
> {
>         char *addr = kmap_atomic(page);
>         memset(addr + offset, 0, len);
>         kunmap_atomic(addr);
> }
> 
> in lib/iov_iter.c?  FWIW, I don't like that "highpage" in the name and
> highmem.h as location - these make perfect sense regardless of highmem;
> they are normal memory operations with page + offset used instead of
> a pointer...

I was thinking along those lines as well especially because of the direction
this patch set takes kmap().

Thanks for pointing these out to me.  How about I lift them to a common header?
But if not highmem.h where?

Ira

