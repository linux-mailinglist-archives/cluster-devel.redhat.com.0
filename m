Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id BB9FD13B26A
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Jan 2020 19:55:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579028155;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=YlzEXfZltTKB3uZX8XavI0Vlae70lrzbT/BY5BfXrLk=;
	b=bYohEWxk+yjrbqsef7ycm2Li1SFu0t6DbZXW/eElTyAFkfjCdhv9VbDhp4kn/JLUuGc5hk
	Vu1PFfolWLXVrNSzoPlnvSf4LWQF3cPeQLWwN1BQ1It/9roPUevbqnawHfmOpKyVw+KQA6
	yyvTWTyPqymLdJLr6Y/yNXkkUkAvM7M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-Ae4I2h8hPRyw2erpodsiYw-1; Tue, 14 Jan 2020 13:55:54 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BF0E18A6EE2;
	Tue, 14 Jan 2020 18:55:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5D405C3F8;
	Tue, 14 Jan 2020 18:55:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A565F18089CD;
	Tue, 14 Jan 2020 18:55:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00EItl83030682 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Jan 2020 13:55:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7D9165DA70; Tue, 14 Jan 2020 18:55:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from llong.remote.csb (ovpn-122-218.rdu2.redhat.com [10.10.122.218])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B79555DA32;
	Tue, 14 Jan 2020 18:55:43 +0000 (UTC)
To: Christoph Hellwig <hch@lst.de>
References: <20200114161225.309792-1-hch@lst.de>
	<20200114161225.309792-3-hch@lst.de>
	<925d1343-670e-8f92-0e73-6e9cee0d3ffb@redhat.com>
	<20200114182514.GA9949@lst.de>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <8fae9cfa-93b0-4d54-6d16-35e920e25b6c@redhat.com>
Date: Tue, 14 Jan 2020 13:55:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20200114182514.GA9949@lst.de>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>,
	linux-fsdevel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>, linux-ext4@vger.kernel.org,
	Will Deacon <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: Ae4I2h8hPRyw2erpodsiYw-1
X-Mimecast-Spam-Score: 0
Content-Type: multipart/mixed; boundary="------------6BEFFBDE05D958EEDA91B3B4"

This is a multi-part message in MIME format.
--------------6BEFFBDE05D958EEDA91B3B4
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 1/14/20 1:25 PM, Christoph Hellwig wrote:
> On Tue, Jan 14, 2020 at 01:17:45PM -0500, Waiman Long wrote:
>> The owner field is just a pointer to the task structure with the lower 3
>> bits served as flag bits. Setting owner to RWSEM_OWNER_UNKNOWN (-2) will
>> stop optimistic spinning. So under what condition did the crash happen?
> When running xfstests with all patches in this series except for this
> one, IIRC in generic/114.

Could you try the attached patch to see if it can fix the problem?

Thanks,
Longman


--------------6BEFFBDE05D958EEDA91B3B4
Content-Type: text/x-patch;
	name="0001-locking-rwsem-Fix-kernel-crash-when-spinning-on-RWSE.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename*0="0001-locking-rwsem-Fix-kernel-crash-when-spinning-on-RWSE.pa";
	filename*1="tch"

>From 1fcfa946609b5e919a6b953a64be6853af5cdf05 Mon Sep 17 00:00:00 2001
From: Waiman Long <longman@redhat.com>
Date: Tue, 14 Jan 2020 13:39:02 -0500
Subject: [PATCH] locking/rwsem: Fix kernel crash when spinning on
 RWSEM_OWNER_UNKNOWN

The commit 91d2a812dfb9 ("locking/rwsem: Make handoff writer
optimistically spin on owner") will allow a recently woken up waiting
writer to spin on the owner. Unfortunately, if the owner happens to be
RWSEM_OWNER_UNKNOWN, the code will incorrectly spin on it leading to a
kernel crash. This is fixed by passing the proper non-spinnable bits
to rwsem_spin_on_owner() so that RWSEM_OWNER_UNKNOWN will be treated
as a non-spinnable target.

Fixes: 91d2a812dfb9 ("locking/rwsem: Make handoff writer optimistically spin on owner")

Reported-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/locking/rwsem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/locking/rwsem.c b/kernel/locking/rwsem.c
index 44e68761f432..1dd3d53f43c3 100644
--- a/kernel/locking/rwsem.c
+++ b/kernel/locking/rwsem.c
@@ -1227,7 +1227,7 @@ rwsem_down_write_slowpath(struct rw_semaphore *sem, int state)
 		 * without sleeping.
 		 */
 		if ((wstate == WRITER_HANDOFF) &&
-		    (rwsem_spin_on_owner(sem, 0) == OWNER_NULL))
+		    rwsem_spin_on_owner(sem, RWSEM_NONSPINNABLE) == OWNER_NULL)
 			goto trylock_again;
 
 		/* Block until there are no active lockers. */
-- 
2.18.1


--------------6BEFFBDE05D958EEDA91B3B4--

