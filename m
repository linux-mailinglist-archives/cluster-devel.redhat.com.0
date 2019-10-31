Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id BFA45EAF1D
	for <lists+cluster-devel@lfdr.de>; Thu, 31 Oct 2019 12:42:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572522160;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UXVSpy3w+L0lcd55xEr0ro9VSAuQu/5Mfd1LAuFF3eU=;
	b=WK6rnXis2h2OI4bG4ITlXn/2rxd39dvNO1xoGQ2eO2ARLwOtyMMRG+XwzV3lF5V6W+TAUc
	uhe7WlRH/Sha+S2393MIR4W6cxLEmlXPZD38281WNqXVMRu0AEnbAcNDg5l2BkVyXSaLS/
	uVdDR3AbKfHnmU+lodVfEXGi8vyqe/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-4BOJ1-baMGKeEk3H-OlKsA-1; Thu, 31 Oct 2019 07:42:39 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB15F1005500;
	Thu, 31 Oct 2019 11:42:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2678A60852;
	Thu, 31 Oct 2019 11:42:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 62B814BB78;
	Thu, 31 Oct 2019 11:42:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9VBf5Mn007523 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 31 Oct 2019 07:41:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0C5FE60BEC; Thu, 31 Oct 2019 11:41:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fogou.chygwyn.com (unknown [10.33.36.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 50F0A60BE0;
	Thu, 31 Oct 2019 11:40:58 +0000 (UTC)
From: Steven Whitehouse <swhiteho@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
References: <157225677483.3442.4227193290486305330.stgit@buzz>
	<20191028124222.ld6u3dhhujfqcn7w@box>
	<CAHk-=wgQ-Dcs2keNJPovTb4gG33M81yANH6KZM9d5NLUb-cJ1g@mail.gmail.com>
	<20191028125702.xdfbs7rqhm3wer5t@box>
	<ac83fee6-9bcd-8c66-3596-2c0fbe6bcf96@yandex-team.ru>
	<CAHk-=who0HS=NT8U7vFDT7er_CD7+ZreRJMxjYrRXs5G6dbpyw@mail.gmail.com>
	<f0140b13-cca2-af9e-eb4b-82eda134eb8f@redhat.com>
	<CAHk-=wh4SKRxKQf5LawRMSijtjRVQevaFioBK+tOZAVPt7ek0Q@mail.gmail.com>
Message-ID: <640bbe51-706b-8d9f-4abc-5f184de6a701@redhat.com>
Date: Thu, 31 Oct 2019 11:40:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wh4SKRxKQf5LawRMSijtjRVQevaFioBK+tOZAVPt7ek0Q@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9VBf5Mn007523
X-loop: cluster-devel@redhat.com
Cc: Steve French <sfrench@samba.org>,
	Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Ronnie Sahlberg <lsahlber@redhat.com>,
	"cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	Linux-MM <linux-mm@kvack.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
	Johannes Weiner <hannes@cmpxchg.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	"Kirill A. Shutemov" <kirill@shutemov.name>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [Cluster-devel] [PATCH] mm/filemap: do not allocate cache pages
 beyond end of file at read
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
X-MC-Unique: 4BOJ1-baMGKeEk3H-OlKsA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

On 30/10/2019 10:54, Linus Torvalds wrote:
> On Wed, Oct 30, 2019 at 11:35 AM Steven Whitehouse<swhiteho@redhat.com>  =
wrote:
>> NFS may be ok here, but it will break GFS2. There may be others too...
>> OCFS2 is likely one. Not sure about CIFS either. Does it really matter
>> that we might occasionally allocate a page and then free it again?
> Why are gfs2 and cifs doing things wrong?
For CIFS I've added Ronnie and Steve to common on that.
> "readpage()" is not for synchrionizing metadata. Never has been. You
> shouldn't treat it that way, and you shouldn't then make excuses for
> filesystems that treat it that way.
>
> Look at mmap, for example. It will do the SIGBUS handling before
> calling readpage(). Same goes for the copyfile code. A filesystem that
> thinks "I will update size at readpage" is already fundamentally
> buggy.
>
> We do _recheck_ the inode size under the page lock, but that's to
> handle the races with truncate etc.
>
>              Linus

For the GFS2 side of things, the algorithm looks like this:

 =C2=A0- Is there an uptodate page in cache?

 =C2=A0=C2=A0 Yes, return it

 =C2=A0=C2=A0 No, call into the fs readpage() to get one

This is designed so that for pages that are available in the page cache,=20
we don't even need to call into the filesystem at all. It is all dealt=20
with at the page cache level, unless the page doesn't exist. At this=20
point we don't know what the i_size might be, and prior to the proposed=20
patch, it simply doesn't matter, since we will ask the filesystem via=20
->readpage() for all pages which are not in the cache.

If the page doesn't exist, we have to take the cluster level locks=20
(glocks in the case of GFS2) which are potentially expensive, certainly=20
a lot more expensive than the page lock anyway. That is currently done=20
at the ->readpage() level, although we do have to drop the page lock=20
first and then get the locks in the correct order, since the lock=20
ordering requires the glock to be taken in shared mode ahead of the page=20
lock.

We've always in the past been able to just use the generic code, since=20
it was written to not assume i_size was valid outside of the fs specific=20
locks. The aim has always been to try and use generic code as much as=20
possible, even though there are some cases where we've had to depart=20
from that for various reasons.

It appears that the filemap_fault issue seems to have not been spotted=20
before. I'm not quite sure how that was missed - seems to show that we=20
have some missing tests, but I agree that it does need to be fixed. It=20
is a while since I last looked at that particular bit of code in detail,=20
so my memory may be a bit fuzzy.

Andreas, Bob, have I missed anything here?

Steve.




