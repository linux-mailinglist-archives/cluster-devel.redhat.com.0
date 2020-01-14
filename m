Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 021F913B1E0
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Jan 2020 19:18:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579025881;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hh3KavZEWvh09y9W/Fa2u/FR21ffnME+K80eDTgvZSQ=;
	b=A5eLVK6LVcSPvpRfBzFbLdKRGz8h2/P+hovoMGk55sX+EB/1rWn+KfDq8gXpRo3vaZKC0y
	2tYNj5425SDAgqb36iUuQCnV7+a3lb5bt7M1pyQm2HDoxDgbGF3DNXzGOta3pdN5kBSswz
	MqcRFW9qy+n5T8xq0m6rbVfm+mjgo7o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-EkOoBlzjPDqBCPpcoml0lQ-1; Tue, 14 Jan 2020 13:17:59 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF059107ACC4;
	Tue, 14 Jan 2020 18:17:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1599626E4C;
	Tue, 14 Jan 2020 18:17:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 61EAA18089C8;
	Tue, 14 Jan 2020 18:17:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00EIHmYj027992 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Jan 2020 13:17:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9BDEA60BE0; Tue, 14 Jan 2020 18:17:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from llong.remote.csb (ovpn-122-218.rdu2.redhat.com [10.10.122.218])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 06F4960BF4;
	Tue, 14 Jan 2020 18:17:44 +0000 (UTC)
To: Christoph Hellwig <hch@lst.de>, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org, 
	cluster-devel@redhat.com
References: <20200114161225.309792-1-hch@lst.de>
	<20200114161225.309792-3-hch@lst.de>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <925d1343-670e-8f92-0e73-6e9cee0d3ffb@redhat.com>
Date: Tue, 14 Jan 2020 13:17:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20200114161225.309792-3-hch@lst.de>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 02/12] locking/rwsem: Exit early when
 held by an anonymous owner
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
X-MC-Unique: EkOoBlzjPDqBCPpcoml0lQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 1/14/20 11:12 AM, Christoph Hellwig wrote:
> The rwsem code overloads the owner field with either a task struct or
> negative magic numbers.  Add a quick hack to catch these negative
> values early on.  Without this spinning on a writer that replaced the
> owner with RWSEM_OWNER_UNKNOWN, rwsem_spin_on_owner can crash while
> deferencing the task_struct ->on_cpu field of a -8 value.
>
> XXX: This might be a bit of a hack as the code otherwise doesn't use
> the ERR_PTR family macros, better suggestions welcome.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  kernel/locking/rwsem.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/kernel/locking/rwsem.c b/kernel/locking/rwsem.c
> index 44e68761f432..6adc719a30a1 100644
> --- a/kernel/locking/rwsem.c
> +++ b/kernel/locking/rwsem.c
> @@ -725,6 +725,8 @@ rwsem_spin_on_owner(struct rw_semaphore *sem, unsigned long nonspinnable)
>  	state = rwsem_owner_state(owner, flags, nonspinnable);
>  	if (state != OWNER_WRITER)
>  		return state;
> +	if (IS_ERR(owner))
> +		return state;
>  
>  	rcu_read_lock();
>  	for (;;) {

The owner field is just a pointer to the task structure with the lower 3
bits served as flag bits. Setting owner to RWSEM_OWNER_UNKNOWN (-2) will
stop optimistic spinning. So under what condition did the crash happen?

Anyway, PeterZ is working on revising the percpu-rwsem implementation to
more gracefully handle the frozen case. At the end, there will not be a
need for the RWSEM_OWNER_UNKNOWN magic and it can be removed.

Cheers,
Longman

RWSEM_OWNER_UNKNOWN

