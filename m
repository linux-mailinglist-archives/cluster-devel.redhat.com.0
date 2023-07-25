Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BFD760FC3
	for <lists+cluster-devel@lfdr.de>; Tue, 25 Jul 2023 11:52:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690278758;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kWgyub2IBaVzc1iBMCrrpo/aj8BhLqrpzUFh+Rk3sVo=;
	b=Pjk8EZO8t+W5+9Bt6Amadt4hRY9EMksU4ZMuPBkCgUA0jRqSqFy/VouzLfcxe8mER2sP4P
	RyWYFwE89ebeD7ZqzAzxCYEVa4e1d6zCVdfSskutRjtgVIUCUoXTupcibjBfxTZ5MkSREn
	LZjPSxh0kW6f6pwg2dnSUm++40cccR8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-687-aBfyqtulNY2wr9ge3B28Wg-1; Tue, 25 Jul 2023 05:52:35 -0400
X-MC-Unique: aBfyqtulNY2wr9ge3B28Wg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D60B1805AF6;
	Tue, 25 Jul 2023 09:52:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7694046A3A7;
	Tue, 25 Jul 2023 09:52:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 11AD0194E00F;
	Tue, 25 Jul 2023 09:52:32 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8B1541946589 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 25 Jul 2023 03:24:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2E0062166B26; Tue, 25 Jul 2023 03:24:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 25E142166B25
 for <cluster-devel@redhat.com>; Tue, 25 Jul 2023 03:24:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08691185A791
 for <cluster-devel@redhat.com>; Tue, 25 Jul 2023 03:24:45 +0000 (UTC)
Received: from out-62.mta0.migadu.com (out-62.mta0.migadu.com
 [91.218.175.62]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-JZeQ_gPuN4-vgFqogGM3xw-1; Mon, 24 Jul 2023 23:24:42 -0400
X-MC-Unique: JZeQ_gPuN4-vgFqogGM3xw-1
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <d2621ad0-8b99-9154-5ff5-509dec2f32a3@bytedance.com>
Date: Tue, 25 Jul 2023 11:23:54 +0800
Message-Id: <6FE62F56-1B4E-4E2A-BEA9-0DA6907A2FA9@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-2-zhengqi.arch@bytedance.com>
 <97E80C37-8872-4C5A-A027-A0B35F39152A@linux.dev>
 <d2621ad0-8b99-9154-5ff5-509dec2f32a3@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Tue, 25 Jul 2023 09:52:30 +0000
Subject: Re: [Cluster-devel] [PATCH v2 01/47] mm: vmscan: move
 shrinker-related code into a separate file
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: kvm@vger.kernel.org, djwong@kernel.org,
 Roman Gushchin <roman.gushchin@linux.dev>, david@fromorbit.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Linux Memory Management List <linux-mm@kvack.org>, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, cel@kernel.org, x86@kernel.org,
 steven.price@arm.com, cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-nfs@vger.kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, yujie.liu@intel.com,
 Vlastimil Babka <vbabka@suse.cz>, linux-raid@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>, tytso@mit.edu,
 Greg KH <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>, netdev <netdev@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



> On Jul 25, 2023, at 11:09, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>=20
>=20
>=20
> On 2023/7/25 10:35, Muchun Song wrote:
>>> On Jul 24, 2023, at 17:43, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>>>=20
>>> The mm/vmscan.c file is too large, so separate the shrinker-related
>>> code from it into a separate file. No functional changes.
>>>=20
>>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>>> ---
>>> include/linux/shrinker.h |   3 +
>>> mm/Makefile              |   4 +-
>>> mm/shrinker.c            | 707 +++++++++++++++++++++++++++++++++++++++
>>> mm/vmscan.c              | 701 --------------------------------------
>>> 4 files changed, 712 insertions(+), 703 deletions(-)
>>> create mode 100644 mm/shrinker.c
>>>=20
>>> diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
>>> index 224293b2dd06..961cb84e51f5 100644
>>> --- a/include/linux/shrinker.h
>>> +++ b/include/linux/shrinker.h
>>> @@ -96,6 +96,9 @@ struct shrinker {
>>>  */
>>> #define SHRINKER_NONSLAB (1 << 3)
>>>=20
>>> +unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *=
memcg,
>>> +    int priority);
>> A good cleanup, vmscan.c is so huge.
>> I'd like to introduce a new header in mm/ directory and contains those
>> declarations of functions (like this and other debug function in
>> shrinker_debug.c) since they are used internally across mm.
>=20
> How about putting them in the mm/internal.h file?

Either is fine to me.

>=20
>> Thanks.


