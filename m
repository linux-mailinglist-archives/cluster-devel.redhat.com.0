Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2885C13CCC2
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Jan 2020 20:03:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579115033;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=h7ITH9zSXCUTo5cxF0HK0l2gxf6eSqZK0z1Jv9XNif0=;
	b=Dk+yDbfVbUWN3/U73T6Y/QGhfk8+qkpHgG/sI1eIk/yvI/Y2NddrhjVQll0ZviTKHwoeeB
	9JkCCBZHqVoMiPU0gkGVijYqvKTNJZ1xnzmsUixUuXsxM2BEalbyjsQeh6Ewqb1VRy3McR
	NyXspaI9a3LxPXuJzWoEkz5bJokPmc8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-3xUHLVs8POmX8M6Mi8wf2w-1; Wed, 15 Jan 2020 14:03:51 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2737800D5E;
	Wed, 15 Jan 2020 19:03:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3EEE5C219;
	Wed, 15 Jan 2020 19:03:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C4FBC18095FF;
	Wed, 15 Jan 2020 19:03:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00FJ3RvN025529 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jan 2020 14:03:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4E46A10372F3; Wed, 15 Jan 2020 19:03:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from llong.remote.csb (dhcp-17-59.bos.redhat.com [10.18.17.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7DBB71000329;
	Wed, 15 Jan 2020 19:03:23 +0000 (UTC)
To: Jason Gunthorpe <jgg@ziepe.ca>, Peter Zijlstra <peterz@infradead.org>
References: <20200114161225.309792-1-hch@lst.de>
	<20200114192700.GC22037@ziepe.ca> <20200115065614.GC21219@lst.de>
	<20200115132428.GA25201@ziepe.ca>
	<20200115143347.GL2827@hirez.programming.kicks-ass.net>
	<20200115144948.GB25201@ziepe.ca>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <849239ff-d2d1-4048-da58-b4347e0aa2bd@redhat.com>
Date: Wed, 15 Jan 2020 14:03:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20200115144948.GB25201@ziepe.ca>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>,
	linux-fsdevel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>, linux-ext4@vger.kernel.org,
	Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] RFC: hold i_rwsem until aio completes
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
X-MC-Unique: 3xUHLVs8POmX8M6Mi8wf2w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 1/15/20 9:49 AM, Jason Gunthorpe wrote:
> On Wed, Jan 15, 2020 at 03:33:47PM +0100, Peter Zijlstra wrote:
>> On Wed, Jan 15, 2020 at 09:24:28AM -0400, Jason Gunthorpe wrote:
>>
>>> I was interested because you are talking about allowing the read/write side
>>> of a rw sem to be held across a return to user space/etc, which is the
>>> same basic problem.
>> No it is not; allowing the lock to be held across userspace doesn't
>> change the owner. This is a crucial difference, PI depends on there
>> being a distinct owner. That said, allowing the lock to be held across
>> userspace still breaks PI in that it completely wrecks the ability to
>> analyze the critical section.
> I'm not sure what you are contrasting?
>
> I was remarking that I see many places open code a rwsem using an
> atomic and a completion specifically because they need to do the
> things Christoph identified:
>
>> (1) no unlocking by another process than the one that acquired it
>> (2) no return to userspace with locks held
> As an example flow: obtain the read side lock, schedual a work queue,
> return to user space, and unlock the read side from the work queue.

We currently have down_read_non_owner() and up_read_non_owner() that
perform the lock and unlock without lockdep tracking. Of course, that is
a hack and their use must be carefully scrutinized to make sure that
there is no deadlock or other potentially locking issues.

Cheers,
Longman

