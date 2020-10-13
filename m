Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0D12028D491
	for <lists+cluster-devel@lfdr.de>; Tue, 13 Oct 2020 21:37:20 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-T2twVm4pOXWM_Km69zSMkw-1; Tue, 13 Oct 2020 15:37:18 -0400
X-MC-Unique: T2twVm4pOXWM_Km69zSMkw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61D3256B2B;
	Tue, 13 Oct 2020 19:37:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9357427CC4;
	Tue, 13 Oct 2020 19:37:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9E85158126;
	Tue, 13 Oct 2020 19:37:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09DJb4xo027406 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 13 Oct 2020 15:37:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D7AAF17433E; Tue, 13 Oct 2020 19:37:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D27B12D7AA5
	for <cluster-devel@redhat.com>; Tue, 13 Oct 2020 19:37:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5FA5811E79
	for <cluster-devel@redhat.com>; Tue, 13 Oct 2020 19:37:02 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-141-Zsvspd6vNgOh33IDtHf7SQ-1; Tue, 13 Oct 2020 15:36:58 -0400
X-MC-Unique: Zsvspd6vNgOh33IDtHf7SQ-1
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1kSQ6F-000768-Gq; Tue, 13 Oct 2020 19:36:43 +0000
Date: Tue, 13 Oct 2020 20:36:43 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Dan Williams <dan.j.williams@intel.com>
Message-ID: <20201013193643.GK20115@casper.infradead.org>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
	<20201009195033.3208459-34-ira.weiny@intel.com>
	<CAPcyv4gL3jfw4d+SJGPqAD3Dp4F_K=X3domuN4ndAA1FQDGcPg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPcyv4gL3jfw4d+SJGPqAD3Dp4F_K=X3domuN4ndAA1FQDGcPg@mail.gmail.com>
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
	linux-mtd@lists.infradead.org, linux-kselftest@vger.kernel.org,
	samba-technical@lists.samba.org, "Weiny,
	Ira" <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
	devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, linux-scsi <linux-scsi@vger.kernel.org>,
	linux-nvdimm <linux-nvdimm@lists.01.org>,
	linux-rdma <linux-rdma@vger.kernel.org>, X86 ML <x86@kernel.org>,
	amd-gfx list <amd-gfx@lists.freedesktop.org>,
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
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-cachefs@redhat.com, linux-nfs@vger.kernel.org,
	Nicolas Pitre <nico@fluxnic.net>, linux-ntfs-dev@lists.sourceforge.net,
	Netdev <netdev@vger.kernel.org>,
	Kexec Mailing List <kexec@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, bpf@vger.kernel.org,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 13, 2020 at 11:44:29AM -0700, Dan Williams wrote:
> On Fri, Oct 9, 2020 at 12:52 PM <ira.weiny@intel.com> wrote:
> >
> > From: Ira Weiny <ira.weiny@intel.com>
> >
> > The kmap() calls in this FS are localized to a single thread.  To avoid
> > the over head of global PKRS updates use the new kmap_thread() call.
> >
> > Cc: Nicolas Pitre <nico@fluxnic.net>
> > Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> > ---
> >  fs/cramfs/inode.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
> > index 912308600d39..003c014a42ed 100644
> > --- a/fs/cramfs/inode.c
> > +++ b/fs/cramfs/inode.c
> > @@ -247,8 +247,8 @@ static void *cramfs_blkdev_read(struct super_block *sb, unsigned int offset,
> >                 struct page *page = pages[i];
> >
> >                 if (page) {
> > -                       memcpy(data, kmap(page), PAGE_SIZE);
> > -                       kunmap(page);
> > +                       memcpy(data, kmap_thread(page), PAGE_SIZE);
> > +                       kunmap_thread(page);
> 
> Why does this need a sleepable kmap? This looks like a textbook
> kmap_atomic() use case.

There's a lot of code of this form.  Could we perhaps have:

static inline void copy_to_highpage(struct page *to, void *vfrom, unsigned int size)
{
	char *vto = kmap_atomic(to);

	memcpy(vto, vfrom, size);
	kunmap_atomic(vto);
}

in linux/highmem.h ?

