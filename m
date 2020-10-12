Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6054E28BD7D
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Oct 2020 18:20:09 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-dVIxswCNN0iix6dEeNdjGw-1; Mon, 12 Oct 2020 12:20:06 -0400
X-MC-Unique: dVIxswCNN0iix6dEeNdjGw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADDC8805F0D;
	Mon, 12 Oct 2020 16:20:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D38B35C22B;
	Mon, 12 Oct 2020 16:20:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 15F3A92318;
	Mon, 12 Oct 2020 16:20:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09CGJtkm021975 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 12 Oct 2020 12:19:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 70874207A506; Mon, 12 Oct 2020 16:19:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B7D6207A64A
	for <cluster-devel@redhat.com>; Mon, 12 Oct 2020 16:19:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0BD981010420
	for <cluster-devel@redhat.com>; Mon, 12 Oct 2020 16:19:53 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-278-Q3V_hRwIPYCcKDHoCTUoSQ-1;
	Mon, 12 Oct 2020 12:19:50 -0400
X-MC-Unique: Q3V_hRwIPYCcKDHoCTUoSQ-1
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
	[172.10.235.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 22B302080A;
	Mon, 12 Oct 2020 16:19:48 +0000 (UTC)
Date: Mon, 12 Oct 2020 09:19:46 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ira Weiny <ira.weiny@intel.com>
Message-ID: <20201012161946.GA858@sol.localdomain>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
	<20201009195033.3208459-23-ira.weiny@intel.com>
	<20201009213434.GA839@sol.localdomain>
	<20201010003954.GW20115@casper.infradead.org>
	<20201010013036.GD1122@sol.localdomain>
	<20201012065635.GB2046448@iweiny-DESK2.sc.intel.com>
MIME-Version: 1.0
In-Reply-To: <20201012065635.GB2046448@iweiny-DESK2.sc.intel.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: linux-aio@kvack.org, linux-efi@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	linux-mmc@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
	amd-gfx@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>, devel@driverdev.osuosl.org,
	linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-nvdimm@lists.01.org,
	linux-rdma@vger.kernel.org, x86@kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, cluster-devel@redhat.com,
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
	linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 11, 2020 at 11:56:35PM -0700, Ira Weiny wrote:
> > 
> > And I still don't really understand.  After this patchset, there is still code
> > nearly identical to the above (doing a temporary mapping just for a memcpy) that
> > would still be using kmap_atomic().
> 
> I don't understand.  You mean there would be other call sites calling:
> 
> kmap_atomic()
> memcpy()
> kunmap_atomic()

Yes, there are tons of places that do this.  Try 'git grep -A6 kmap_atomic'
and look for memcpy().

Hence why I'm asking what will be the "recommended" way to do this...
kunmap_thread() or kmap_atomic()?

> And since I don't know the call site details if there are kmap_thread() calls
> which are better off as kmap_atomic() calls I think it is worth converting
> them.  But I made the assumption that kmap users would already be calling
> kmap_atomic() if they could (because it is more efficient).

Not necessarily.  In cases where either one is correct, people might not have
put much thought into which of kmap() and kmap_atomic() they are using.

- Eric

