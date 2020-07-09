Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5F19B219AC3
	for <lists+cluster-devel@lfdr.de>; Thu,  9 Jul 2020 10:26:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594283204;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lZzkV3MawPwjnH2A6+i/gZ/LnvMbuWxGQy5lTADJWpQ=;
	b=AGUn1OLM8VBfhgS32avk7//GMpw8XTdhRWWwZluYF1FAeyXnoc0O9LzRM8XjBLJaG1U6Ov
	/McBQrOuzA76fYCKrccnP5Sgj8NXKtfxmlfqAG1qIIPfP1cQ4zUIYDcO9HkFqoB2frr3zz
	G4zArxqNthdrd6HS26MbF0Gdjtofonw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-fT1WN-0iMFKNIQsWmhczcg-1; Thu, 09 Jul 2020 04:26:43 -0400
X-MC-Unique: fT1WN-0iMFKNIQsWmhczcg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 783251094;
	Thu,  9 Jul 2020 08:26:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C521979814;
	Thu,  9 Jul 2020 08:26:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BBF811809547;
	Thu,  9 Jul 2020 08:26:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0698QVsS018070 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 04:26:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9F02B79CFC; Thu,  9 Jul 2020 08:26:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fogou.chygwyn.com (unknown [10.33.36.52])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC38379815;
	Thu,  9 Jul 2020 08:26:24 +0000 (UTC)
To: Christoph Hellwig <hch@lst.de>, Matthew Wilcox <willy@infradead.org>
References: <20200629192353.20841-1-rgoldwyn@suse.de>
	<20200629192353.20841-3-rgoldwyn@suse.de>
	<20200701075310.GB29884@lst.de>
	<20200707124346.xnr5gtcysuzehejq@fiona>
	<20200707125705.GK25523@casper.infradead.org>
	<20200707130030.GA13870@lst.de>
	<20200708065127.GM2005@dread.disaster.area>
	<20200708135437.GP25523@casper.infradead.org>
	<20200708165412.GA637@lst.de>
From: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <126c9e1b-145f-3725-fbde-92135f52a4a3@redhat.com>
Date: Thu, 9 Jul 2020 09:26:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200708165412.GA637@lst.de>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, fdmanana@gmail.com, darrick.wong@oracle.com,
	Goldwyn Rodrigues <rgoldwyn@suse.de>,
	Dave Chinner <david@fromorbit.com>, dsterba@suse.cz,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] always fall back to buffered I/O after
 invalidation failures,
 was: Re: [PATCH 2/6] iomap: IOMAP_DIO_RWF_NO_STALE_PAGECACHE return if page
 invalidation fails
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 08/07/2020 17:54, Christoph Hellwig wrote:
> On Wed, Jul 08, 2020 at 02:54:37PM +0100, Matthew Wilcox wrote:
>> Direct I/O isn't deterministic though.  If the file isn't shared, then
>> it works great, but as soon as you get mixed buffered and direct I/O,
>> everything is already terrible.  Direct I/Os perform pagecache lookups
>> already, but instead of using the data that we found in the cache, we
>> (if it's dirty) write it back, wait for the write to complete, remove
>> the page from the pagecache and then perform another I/O to get the data
>> that we just wrote out!  And then the app that's using buffered I/O has
>> to read it back in again.
> Mostly agreed.  That being said I suspect invalidating clean cache
> might still be a good idea.  The original idea was mostly on how
> to deal with invalidation failures of any kind, but falling back for
> any kind of dirty cache also makes at least some sense.
>
>> I have had an objection raised off-list.  In a scenario with a block
>> device shared between two systems and an application which does direct
>> I/O, everything is normally fine.  If one of the systems uses tar to
>> back up the contents of the block device then the application on that
>> system will no longer see the writes from the other system because
>> there's nothing to invalidate the pagecache on the first system.
> Err, WTF?  If someone access shared block devices with random
> applications all bets are off anyway.

On GFS2 the locking should take care of that. Not 100% sure about OCFS2 
without looking, but I'm fairly sure that they have a similar 
arrangement. So this shouldn't be a problem unless there is an 
additional cluster fs that I'm not aware of that they are using in this 
case. It would be good to confirm which fs they are using,

Steve.


