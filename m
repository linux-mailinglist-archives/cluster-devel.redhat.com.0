Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 007C728B0DE
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Oct 2020 10:53:47 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-YdRMTtPOMEa3bbbQFlhPYA-1; Mon, 12 Oct 2020 04:53:24 -0400
X-MC-Unique: YdRMTtPOMEa3bbbQFlhPYA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56328807328;
	Mon, 12 Oct 2020 08:53:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 440BD76663;
	Mon, 12 Oct 2020 08:53:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 31C349731F;
	Mon, 12 Oct 2020 08:53:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09A4hS0a015637 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 10 Oct 2020 00:43:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 297FE2166BA3; Sat, 10 Oct 2020 04:43:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 249B92166B28
	for <cluster-devel@redhat.com>; Sat, 10 Oct 2020 04:43:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EBDFB185AD2F
	for <cluster-devel@redhat.com>; Sat, 10 Oct 2020 04:43:25 +0000 (UTC)
Received: from out01.mta.xmission.com (out01.mta.xmission.com
	[166.70.13.231]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-397-eLBGXYCxODW5lf2DSVG1UA-1; Sat, 10 Oct 2020 00:43:23 -0400
X-MC-Unique: eLBGXYCxODW5lf2DSVG1UA-1
Received: from in02.mta.xmission.com ([166.70.13.52])
	by out01.mta.xmission.com with esmtps (TLS1.2) tls
	TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1kR5ma-003qSe-1R; Fri, 09 Oct 2020 21:42:56 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]
	helo=x220.xmission.com) by in02.mta.xmission.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
	(envelope-from <ebiederm@xmission.com>)
	id 1kR5mZ-0002tO-03; Fri, 09 Oct 2020 21:42:55 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: ira.weiny@intel.com
References: <20201009195033.3208459-1-ira.weiny@intel.com>
	<20201009195033.3208459-52-ira.weiny@intel.com>
Date: Fri, 09 Oct 2020 22:43:15 -0500
In-Reply-To: <20201009195033.3208459-52-ira.weiny@intel.com> (ira weiny's
	message of "Fri, 9 Oct 2020 12:50:26 -0700")
Message-ID: <87k0vysq3w.fsf@x220.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1kR5mZ-0002tO-03; ; ; mid=<87k0vysq3w.fsf@x220.int.ebiederm.org>;
	; ; hst=in02.mta.xmission.com; ; ; ip=68.227.160.95; ; ;
	frm=ebiederm@xmission.com; ; ; spf=neutral
X-XM-AID: U2FsdGVkX1+M6Nwc1eevosTTnX6IxBw6BnHTGm05YjI=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa05.xmission.com
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=8.0 tests=ALL_TRUSTED,BAYES_50,
	DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG,T_TooManySym_01,
	T_TooManySym_02,T_TooManySym_03,T_XMDrugObfuBody_08,XMSubLong
	autolearn=disabled version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.5000] *  0.7 XMSubLong Long Subject
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa05 1397; Body=1 Fuz1=1 Fuz2=1]
	*  0.0 T_TooManySym_01 4+ unique symbols in subject
	*  1.0 T_XMDrugObfuBody_08 obfuscated drug references
	*  0.0 T_TooManySym_02 5+ unique symbols in subject
	*  0.0 T_TooManySym_03 6+ unique symbols in subject
X-Spam-DCC: XMission; sa05 1397; Body=1 Fuz1=1 Fuz2=1
X-Spam-Combo: *;ira.weiny@intel.com
X-Spam-Relay-Country: 
X-Spam-Timing: total 512 ms - load_scoreonly_sql: 0.07 (0.0%),
	signal_user_changed: 13 (2.5%), b_tie_ro: 11 (2.2%), parse: 1.72
	(0.3%), extract_message_metadata: 23 (4.4%), get_uri_detail_list: 2.3
	(0.5%), tests_pri_-1000: 25 (4.8%), tests_pri_-950: 1.65 (0.3%),
	tests_pri_-900: 1.39 (0.3%), tests_pri_-90: 81 (15.8%), check_bayes:
	78 (15.3%), b_tokenize: 16 (3.2%), b_tok_get_all: 9 (1.8%),
	b_comp_prob: 2.3 (0.5%), b_tok_touch_all: 47 (9.1%), b_finish: 1.06
	(0.2%), tests_pri_0: 332 (64.8%), check_dkim_signature: 0.75 (0.1%),
	check_dkim_adsp: 18 (3.5%), poll_dns_idle: 0.34 (0.1%), tests_pri_10:
	4.5 (0.9%), tests_pri_500: 25 (5.0%), rewrite_mail: 0.00 (0.0%)
X-Spam-Flag: No
X-SA-Exim-Version: 4.2.1 (built Thu, 05 May 2016 13:38:54 -0600)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
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
	ceph-devel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	io-uring@vger.kernel.org, cluster-devel@redhat.com,
	Ingo Molnar <mingo@redhat.com>, intel-wired-lan@lists.osuosl.org,
	xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
	Fenghua Yu <fenghua.yu@intel.com>, linux-afs@lists.infradead.org,
	linux-um@lists.infradead.org, intel-gfx@lists.freedesktop.org,
	ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-bcache@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>, drbd-dev@tron.linbit.com,
	Dan Williams <dan.j.williams@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-cachefs@redhat.com, linux-nfs@vger.kernel.org,
	linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH RFC PKS/PMEM 51/58] kernel: Utilize new
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

ira.weiny@intel.com writes:

> From: Ira Weiny <ira.weiny@intel.com>
>
> This kmap() call is localized to a single thread.  To avoid the over
> head of global PKRS updates use the new kmap_thread() call.

Acked-by: "Eric W. Biederman" <ebiederm@xmission.com>

>
> Cc: Eric Biederman <ebiederm@xmission.com>
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> ---
>  kernel/kexec_core.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
> index c19c0dad1ebe..272a9920c0d6 100644
> --- a/kernel/kexec_core.c
> +++ b/kernel/kexec_core.c
> @@ -815,7 +815,7 @@ static int kimage_load_normal_segment(struct kimage *image,
>  		if (result < 0)
>  			goto out;
>  
> -		ptr = kmap(page);
> +		ptr = kmap_thread(page);
>  		/* Start with a clear page */
>  		clear_page(ptr);
>  		ptr += maddr & ~PAGE_MASK;
> @@ -828,7 +828,7 @@ static int kimage_load_normal_segment(struct kimage *image,
>  			memcpy(ptr, kbuf, uchunk);
>  		else
>  			result = copy_from_user(ptr, buf, uchunk);
> -		kunmap(page);
> +		kunmap_thread(page);
>  		if (result) {
>  			result = -EFAULT;
>  			goto out;
> @@ -879,7 +879,7 @@ static int kimage_load_crash_segment(struct kimage *image,
>  			goto out;
>  		}
>  		arch_kexec_post_alloc_pages(page_address(page), 1, 0);
> -		ptr = kmap(page);
> +		ptr = kmap_thread(page);
>  		ptr += maddr & ~PAGE_MASK;
>  		mchunk = min_t(size_t, mbytes,
>  				PAGE_SIZE - (maddr & ~PAGE_MASK));
> @@ -895,7 +895,7 @@ static int kimage_load_crash_segment(struct kimage *image,
>  		else
>  			result = copy_from_user(ptr, buf, uchunk);
>  		kexec_flush_icache_page(page);
> -		kunmap(page);
> +		kunmap_thread(page);
>  		arch_kexec_pre_free_pages(page_address(page), 1);
>  		if (result) {
>  			result = -EFAULT;

