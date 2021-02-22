Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0CBF6321401
	for <lists+cluster-devel@lfdr.de>; Mon, 22 Feb 2021 11:21:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613989319;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=K5N3acjJESBdf/WuFTLXo71/GcclYpSD2MGs/NmeHOM=;
	b=Ut9uVVpjzb45qmwWZt0dVNuFRibeqsmi+SjWE2NKCffRgBEUGs3hhN6t6/v+nhLyJxv00d
	k2OKu8R/9fsGkeACdeceOWV1JNybUjDP29Kbcsi3eWDcZ7xEXe8PrlirZo58vThY2xVCLn
	RMcwup5ZL+TZdHaMWvH0CrcHYjgBYA8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340--HTXi9ihO2GSRZueAG8xig-1; Mon, 22 Feb 2021 05:21:57 -0500
X-MC-Unique: -HTXi9ihO2GSRZueAG8xig-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 942D3102C806;
	Mon, 22 Feb 2021 10:21:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 44D3619C78;
	Mon, 22 Feb 2021 10:21:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7263D18095CC;
	Mon, 22 Feb 2021 10:21:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11MAL0Qs006420 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 22 Feb 2021 05:21:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DD02E1A86B; Mon, 22 Feb 2021 10:21:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fogou.chygwyn.com (unknown [10.33.36.78])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D81419C78;
	Mon, 22 Feb 2021 10:20:48 +0000 (UTC)
To: Andreas Gruenbacher <agruenba@redhat.com>
References: <CACrDRjiiXtz6cOO8FmnZHKte2EVKAFzDESXJ5a8oALd7h+EizA@mail.gmail.com>
	<CACrDRjjOgEsqOSWK1PeMro4WQxKkmR=KEfCCRQzBGCwtY+fevQ@mail.gmail.com>
	<93452e4c-af81-225f-34f5-f297473164ae@redhat.com>
	<CAHc6FU6jQ3KGgKgQHy_WaX-40nqWxGbJNqmAcSFtJPweR7AtQg@mail.gmail.com>
From: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <cd213bd4-3bc0-bb8f-0e8f-de2a26a62731@redhat.com>
Date: Mon, 22 Feb 2021 10:20:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAHc6FU6jQ3KGgKgQHy_WaX-40nqWxGbJNqmAcSFtJPweR7AtQg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] Recording extents in GFS2
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative;
	boundary="------------E6D7894382A34DF97721F345"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------E6D7894382A34DF97721F345
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20/02/2021 09:48, Andreas Gruenbacher wrote:
> Hi all,
>
> once we change the journal format, in addition to recording block 
> numbers as extents, there are some additional issues we should address 
> at the same time:
>
> I. The current transaction format of our journals is as follows:
>
>   * One METADATA log descriptor block for each [503 / 247 / 119 / 55]
>     metadata blocks, followed by those metadata blocks. For each
>     metadata block, the log descriptor records the 64-bit block number.
>   * One JDATA log descriptor block for each [251 / 123 / 59 / 27]
>     metadata blocks, followed by those metadata blocks. For each
>     metadata block, the log descriptor records the 64-bit block number
>     and another 64-bit field for indicating whether the block needed
>     escaping.
>   * One REVOKE log descriptor block for the initial [503 / 247 / 119 /
>     55] revokes, followed by a metadata header (not to be confused
>     with the log header) for each additional [509 / 253 / 125 / 61]
>     revokes. Each revoke is recorded as a 64-bit block number in its
>     REVOKE log descriptor or metadata header.
>   * One log header with various necessary and useful metadata that
>     acts as a COMMIT record. If the log header is incorrect or
>     missing, the preceding log descriptors are ignored.
>
^^^^ succeeding? (I hope!)
> We should change that so that a single log descriptor contains a 
> number of records. There should be records for METADATA and JDATA 
> blocks that follow, as well as for REVOKES and for COMMIT. If a 
> transaction contains metadata and/or jdata blocks, those will 
> obviously need a precursor and a commit block like today, but we 
> shouldn't need separate blocks for metadata and journaled data in many 
> cases. Small transactions that only consist of revokes and of a commit 
> should frequently fit into a single block entirely, though.
>
Yes, it makes sense to try and condense what we are writing. Why would 
we not need to have separate blocks for journaled data though? That one 
seems difficult to avoid, and since it is used so infrequently, perhaps 
not such an important issue.


> Right now, we're writing log headers ("commits") with REQ_PREFLUSH to 
> make sure all the log descriptors of a transaction make it to disk 
> before the log header. Depending on the device, this is often costly. 
> If we can fit an entire transaction into a single block, REQ_PREFLUSH 
> won't be needed anymore.

I'm not sure I agree. The purpose of the preflush is to ensure that the 
data and the preceding log blocks are really on disk before we write the 
commit record. That will still be required while we use ordered writes, 
even if we can use (as you suggest below) a checksum to cover the whole 
transaction, and thus check for a complete log record after the fact. 
Also, we would still have to issue the flush in the case of a fsync 
derived log flush too.


>
> III. We could also checksum entire transactions to avoid REQ_PREFLUSH. 
> At replay time, all the blocks that make up a transaction will either 
> be there and the checksum will match, or the transaction will be 
> invalid. This should be less prohibitively expensive with CPU support 
> for CRC32C nowadays, but depending on the hardware, it may make sense 
> to turn this off.
>
> IV. We need recording of unwritten blocks / extents (allocations / 
> fallocate) as this will significantly speed up moving glocks from one 
> node to another:

That would definitely be a step forward.


>
> At the moment, data=ordered is implemented by keeping a list of all 
> inodes that did an ordered write. When it comes time to flush the log, 
> the data of all those ordered inodes is flushed first. When all we 
> want is to flush a single glock in order to move it to a different 
> node, we currently flush all the ordered inodes as well as the journal.
>
> If we only flushed the ordered data of the glock being moved plus the 
> entire journal, the ordering guarantees for the other ordered inodes 
> in the journal would be violated. In that scenario, unwritten blocks 
> could (and would) show up in files after crashes.
>
> If we instead record unwritten blocks in the journal, we'll know which 
> blocks need to be zeroed out at recovery time. Once an unwritten block 
> is written, we record a REVOKE entry for that block.
>
> This comes at the cost of tracking those blocks of course, but with 
> that in place, moving a glock from one node to another will only 
> require flushing the underlying inode (assuming it's a inode glock) 
> and the journal. And most likely, we won't have to bother with 
> implementing "simple" transactions as described in 
> https://bugzilla.redhat.com/show_bug.cgi?id=1631499.
>
> Thanks,
> Andreas

That would be another way of looking at the problem, yes. It does add a 
lot to the complexity though, and it doesn't scale very well on systems 
with large amounts of memory (and therefore potentially lots of 
unwritten extents to record & keep track of). If there are lots of small 
transactions, then each one might be significantly expanded by the need 
to write the info to track the things which have not been written yet.

If we keep track of individual allocations/deallocations, as per Abhi's 
suggestion, then we know where the areas are which may potentially have 
unwritten data in them. That may allow us to avoid having to do the data 
writeback ahead of the journal flush in the first place - moving 
something more towards the XFS way of doing things. We would have to 
ensure that we did get data written back before the allocation records 
vanish from the active part of the log though, so a slightly different 
constraint to currently,

Steve.


--------------E6D7894382A34DF97721F345
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <p>Hi,<br>
    </p>
    <div class=3D"moz-cite-prefix">On 20/02/2021 09:48, Andreas
      Gruenbacher wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CAHc6FU6jQ3KGgKgQHy_WaX-40nqWxGbJNqmAcSFtJPweR7AtQg@mail.gmail.=
com">
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF=
-8">
      <div dir=3D"ltr">Hi all,<br>
        <br>
        once we change the journal format, in addition to recording
        block numbers as extents, there are some additional issues we
        should address at the same time:<br>
        <br>
        I. The current transaction format of our journals is as follows:<br=
>
        <ul>
          <li>One METADATA log descriptor block for each [503 / 247 /
            119 / 55] metadata blocks, followed by those metadata
            blocks. For each metadata block, the log descriptor records
            the 64-bit block number.</li>
          <li>One JDATA log descriptor block for each [251 / 123 / 59 /
            27] metadata blocks, followed by those metadata blocks. For
            each metadata block, the log descriptor records the 64-bit
            block number and another 64-bit field for indicating whether
            the block needed escaping.</li>
          <li>One REVOKE log descriptor block for the initial [503 / 247
            / 119 / 55] revokes, followed by a metadata header (not to
            be confused with the log header) for each additional [509 /
            253 / 125 / 61] revokes. Each revoke is recorded as a 64-bit
            block number in its REVOKE log descriptor or metadata
            header.</li>
          <li>One log header with various necessary and useful metadata
            that acts as a COMMIT record. If the log header is incorrect
            or missing, the preceding log descriptors are ignored.<br>
          </li>
        </ul>
      </div>
    </blockquote>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0
    ^^^^ succeeding? (I hope!)<br>
    <blockquote type=3D"cite"
cite=3D"mid:CAHc6FU6jQ3KGgKgQHy_WaX-40nqWxGbJNqmAcSFtJPweR7AtQg@mail.gmail.=
com">
      <div dir=3D"ltr">
        <div>We should change that so that a single log descriptor
          contains a number of records. There should be records for
          METADATA and JDATA blocks that follow, as well as for REVOKES
          and for COMMIT. If a transaction contains metadata and/or
          jdata blocks, those will obviously need a precursor and a
          commit block like today, but we shouldn't need separate blocks
          for metadata and journaled data in many cases. Small
          transactions that only consist of revokes and of a commit
          should frequently fit into a single block entirely, though.</div>
        <div><br>
        </div>
      </div>
    </blockquote>
    <p>Yes, it makes sense to try and condense what we are writing. Why
      would we not need to have separate blocks for journaled data
      though? That one seems difficult to avoid, and since it is used so
      infrequently, perhaps not such an important issue.</p>
    <p><br>
    </p>
    <blockquote type=3D"cite"
cite=3D"mid:CAHc6FU6jQ3KGgKgQHy_WaX-40nqWxGbJNqmAcSFtJPweR7AtQg@mail.gmail.=
com">
      <div dir=3D"ltr">
        <div>Right now, we're writing log headers ("commits") with
          REQ_PREFLUSH to make sure all the log descriptors of a
          transaction make it to disk before the log header. Depending
          on the device, this is often costly. If we can fit an entire
          transaction into a single block, REQ_PREFLUSH won't be needed
          anymore.</div>
      </div>
    </blockquote>
    <p>I'm not sure I agree. The purpose of the preflush is to ensure
      that the data and the preceding log blocks are really on disk
      before we write the commit record. That will still be required
      while we use ordered writes, even if we can use (as you suggest
      below) a checksum to cover the whole transaction, and thus check
      for a complete log record after the fact. Also, we would still
      have to issue the flush in the case of a fsync derived log flush
      too.</p>
    <p><br>
    </p>
    <blockquote type=3D"cite"
cite=3D"mid:CAHc6FU6jQ3KGgKgQHy_WaX-40nqWxGbJNqmAcSFtJPweR7AtQg@mail.gmail.=
com">
      <div dir=3D"ltr">
        <div><br>
        </div>
        <div>III. We could also checksum entire transactions to avoid
          REQ_PREFLUSH. At replay time, all the blocks that make up a
          transaction will either be there and the checksum will match,
          or the transaction will be invalid. This should be less
          prohibitively expensive with CPU support for CRC32C nowadays,
          but depending on the hardware, it may make sense to turn this
          off.<br>
        </div>
        <div><br>
        </div>
        <div>IV. We need recording of unwritten blocks / extents
          (allocations / fallocate) as this will significantly speed up
          moving glocks from one node to another:</div>
      </div>
    </blockquote>
    <p>That would definitely be a step forward.<br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite"
cite=3D"mid:CAHc6FU6jQ3KGgKgQHy_WaX-40nqWxGbJNqmAcSFtJPweR7AtQg@mail.gmail.=
com">
      <div dir=3D"ltr">
        <div><br>
        </div>
        <div>At the moment, data=3Dordered is implemented by keeping a
          list of all inodes that did an ordered write. When it comes
          time to flush the log, the data of all those ordered inodes is
          flushed first. When all we want is to flush a single glock in
          order to move it to a different node, we currently flush all
          the ordered inodes as well as the journal.</div>
        <div><br>
        </div>
        <div>If we only flushed the ordered data of the glock being
          moved plus the entire journal, the ordering guarantees for the
          other ordered inodes in the journal would be violated. In that
          scenario, unwritten blocks could (and would) show up in files
          after crashes.<br>
        </div>
        <div><br>
        </div>
        <div>If we instead record unwritten blocks in the journal, we'll
          know which blocks need to be zeroed out at recovery time. Once
          an unwritten block is written, we record a REVOKE entry for
          that block.</div>
        <div><br>
        </div>
        <div>This comes at the cost of tracking those blocks of course,
          but with that in place, moving a glock from one node to
          another will only require flushing the underlying inode
          (assuming it's a inode glock) and the journal. And most
          likely, we won't have to bother with implementing <span
            id=3D"gmail-summary_container"><span
              id=3D"gmail-short_desc_nonedit_display">"simple"
              transactions as described in </span></span><a
            href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1631499"
            moz-do-not-send=3D"true">https://bugzilla.redhat.com/show_bug.c=
gi?id=3D1631499</a>.<br>
        </div>
        <div><br>
        </div>
        <div>Thanks,</div>
        <div>Andreas<br>
        </div>
      </div>
    </blockquote>
    <p>That would be another way of looking at the problem, yes. It does
      add a lot to the complexity though, and it doesn't scale very well
      on systems with large amounts of memory (and therefore potentially
      lots of unwritten extents to record &amp; keep track of). If there
      are lots of small transactions, then each one might be
      significantly expanded by the need to write the info to track the
      things which have not been written yet.</p>
    <p>If we keep track of individual allocations/deallocations, as per
      Abhi's suggestion, then we know where the areas are which may
      potentially have unwritten data in them. That may allow us to
      avoid having to do the data writeback ahead of the journal flush
      in the first place - moving something more towards the XFS way of
      doing things. We would have to ensure that we did get data written
      back before the allocation records vanish from the active part of
      the log though, so a slightly different constraint to currently,<br>
    </p>
    <p>Steve.<br>
    </p>
  </body>
</html>

--------------E6D7894382A34DF97721F345--

