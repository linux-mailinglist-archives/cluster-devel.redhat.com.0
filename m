Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id D7D113217EA
	for <lists+cluster-devel@lfdr.de>; Mon, 22 Feb 2021 14:04:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613999047;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=zSvGD2OtBMYX5HT9VSUgJFCS9XFkbZv8B/YnIClHNLI=;
	b=XZbHCM6SYPMBdWg0CQp7RYq6OxRBEcDyZFVTjkZ/2RhKacx5PnFQmomAQrRscWQJD3k1/y
	5o3M1gIgAa0VMWP8iaamfeW/RoQUgBcHF9aicTJDC1Tm1ep/NpkQMYNnHLIZ77Ma2IFsk3
	9YpkcdDxiSUjaDvZ4Ki7x3S22t7DgEM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-Z3Q0cfJpNEaGp4Vi3ijFPg-1; Mon, 22 Feb 2021 08:04:05 -0500
X-MC-Unique: Z3Q0cfJpNEaGp4Vi3ijFPg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 792C31E564;
	Mon, 22 Feb 2021 13:04:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A226710016DB;
	Mon, 22 Feb 2021 13:04:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F074218095CB;
	Mon, 22 Feb 2021 13:03:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11MD3s6v024297 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 22 Feb 2021 08:03:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6775C6D9D4; Mon, 22 Feb 2021 13:03:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6134A42AC1
	for <cluster-devel@redhat.com>; Mon, 22 Feb 2021 13:03:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8E3B9291A5
	for <cluster-devel@redhat.com>; Mon, 22 Feb 2021 13:03:49 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
	[209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-510-rbcilymJNsGVxYV2L6A1Lg-1; Mon, 22 Feb 2021 08:03:47 -0500
X-MC-Unique: rbcilymJNsGVxYV2L6A1Lg-1
Received: by mail-wr1-f70.google.com with SMTP id k5so1020992wrw.14
	for <cluster-devel@redhat.com>; Mon, 22 Feb 2021 05:03:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zSvGD2OtBMYX5HT9VSUgJFCS9XFkbZv8B/YnIClHNLI=;
	b=gAfRvGVqEUTydsaN901n7V0EKulE6iJEHba4SDdDXAruy0mIY7osvMBg5fGVK220L4
	o6U4j8Uqj9vRjTNqkrszj/YSUvB3yv6RrOvGn55MeZnHFS6CC43rn3t5FhnEOJ1iCHA9
	wAd8eHsKXcnB3lMiowVcm2DfhIKEoMnC/BnyWlNH7jgVU3bYnQ7korOkRztCC1RuLwoe
	4FQ35BWvTt+1pTOLgl1CHfnuoLbx61YY5LbpmdhXhc5lHugtAeDS2QbOC4xva2T5pHnA
	swifSBIxLHIB2QICtpmKXqLvlFD/I+k1f35Brua0HeeqmT8IGrSAZabqsQdOhZEzSu8q
	HbdQ==
X-Gm-Message-State: AOAM531R2xrnz0euolHHhrwpoK72wl/84c4awYqN2bq7eIDt+AgkUjDf
	F7E8quC2ipeseYUZvgKh8fZ7mWZluB7a7Yhh2hkC88Z6Qp/2Xnd/yZHC2BS6RQyySgOjM1AkE0o
	vUJNVtMhtGgvtlYK0bj94AYwgq3Ovtfkcdp/JSw==
X-Received: by 2002:a5d:6643:: with SMTP id f3mr447214wrw.182.1613999026019;
	Mon, 22 Feb 2021 05:03:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/T+vtu6F9vSakmCch5uSUCfnySEVPKNG82XQaMNvD7DVfaQcuhQNO80iOMo//769OMiy1MlD9jnbbls5Wgd0=
X-Received: by 2002:a5d:6643:: with SMTP id f3mr447204wrw.182.1613999025848;
	Mon, 22 Feb 2021 05:03:45 -0800 (PST)
MIME-Version: 1.0
References: <CACrDRjiiXtz6cOO8FmnZHKte2EVKAFzDESXJ5a8oALd7h+EizA@mail.gmail.com>
	<CACrDRjjOgEsqOSWK1PeMro4WQxKkmR=KEfCCRQzBGCwtY+fevQ@mail.gmail.com>
	<93452e4c-af81-225f-34f5-f297473164ae@redhat.com>
	<CAHc6FU6jQ3KGgKgQHy_WaX-40nqWxGbJNqmAcSFtJPweR7AtQg@mail.gmail.com>
	<cd213bd4-3bc0-bb8f-0e8f-de2a26a62731@redhat.com>
	<CAHc6FU4C1FaLjxZmz5USHS+Nruthto4WYhxqkW0wjB_h8tX6=g@mail.gmail.com>
In-Reply-To: <CAHc6FU4C1FaLjxZmz5USHS+Nruthto4WYhxqkW0wjB_h8tX6=g@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 22 Feb 2021 14:03:34 +0100
Message-ID: <CAHc6FU6fs+Oizg4acpn-afLW1atRrnHmfDx5F0YV3RjMvqe_Aw@mail.gmail.com>
To: Steven Whitehouse <swhiteho@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000009a94bc05bbec6eeb"

--0000000000009a94bc05bbec6eeb
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 22, 2021 at 12:41 PM Andreas Gruenbacher <agruenba@redhat.com>
wrote:

> On Mon, Feb 22, 2021 at 11:21 AM Steven Whitehouse <swhiteho@redhat.com>
> wrote:
>
>> Hi,
>> On 20/02/2021 09:48, Andreas Gruenbacher wrote:
>>
>> Hi all,
>>
>> once we change the journal format, in addition to recording block numbers
>> as extents, there are some additional issues we should address at the same
>> time:
>>
>> I. The current transaction format of our journals is as follows:
>>
>>    - One METADATA log descriptor block for each [503 / 247 / 119 / 55]
>>    metadata blocks, followed by those metadata blocks. For each metadata
>>    block, the log descriptor records the 64-bit block number.
>>    - One JDATA log descriptor block for each [251 / 123 / 59 / 27]
>>    metadata blocks, followed by those metadata blocks. For each metadata
>>    block, the log descriptor records the 64-bit block number and another
>>    64-bit field for indicating whether the block needed escaping.
>>    - One REVOKE log descriptor block for the initial [503 / 247 / 119 /
>>    55] revokes, followed by a metadata header (not to be confused with the log
>>    header) for each additional [509 / 253 / 125 / 61] revokes. Each revoke is
>>    recorded as a 64-bit block number in its REVOKE log descriptor or metadata
>>    header.
>>    - One log header with various necessary and useful metadata that acts
>>    as a COMMIT record. If the log header is incorrect or missing, the
>>    preceding log descriptors are ignored.
>>
>>                                                                   ^^^^
>> succeeding? (I hope!)
>>
>
> No, we call lops_before_commit (which writes the various log descriptors,
> metadata, and journaled data blocks) before writing the log header in
> log_write_header -> gfs2_write_log_header. In that sense, we could call it
> a trailer.
>
> We should change that so that a single log descriptor contains a number of
>> records. There should be records for METADATA and JDATA blocks that follow,
>> as well as for REVOKES and for COMMIT. If a transaction contains metadata
>> and/or jdata blocks, those will obviously need a precursor and a commit
>> block like today, but we shouldn't need separate blocks for metadata and
>> journaled data in many cases. Small transactions that only consist of
>> revokes and of a commit should frequently fit into a single block entirely,
>> though.
>>
>> Yes, it makes sense to try and condense what we are writing. Why would we
>> not need to have separate blocks for journaled data though? That one seems
>> difficult to avoid, and since it is used so infrequently, perhaps not such
>> an important issue.
>>
> Journaled data would of course still need to be written. We could have a
> single log descriptor with METADATA and JDATA records, followed by the
> metadata and journaled data blocks, followed by a log descriptor with a
> COMMIT record.
>
>> Right now, we're writing log headers ("commits") with REQ_PREFLUSH to
>> make sure all the log descriptors of a transaction make it to disk before
>> the log header. Depending on the device, this is often costly. If we can
>> fit an entire transaction into a single block, REQ_PREFLUSH won't be needed
>> anymore.
>>
>> I'm not sure I agree. The purpose of the preflush is to ensure that the
>> data and the preceding log blocks are really on disk before we write the
>> commit record. That will still be required while we use ordered writes,
>> even if we can use (as you suggest below) a checksum to cover the whole
>> transaction, and thus check for a complete log record after the fact. Also,
>> we would still have to issue the flush in the case of a fsync derived log
>> flush too.
>>
>>
>>
>> III. We could also checksum entire transactions to avoid REQ_PREFLUSH. At
>> replay time, all the blocks that make up a transaction will either be there
>> and the checksum will match, or the transaction will be invalid. This
>> should be less prohibitively expensive with CPU support for CRC32C
>> nowadays, but depending on the hardware, it may make sense to turn this off.
>>
>> IV. We need recording of unwritten blocks / extents (allocations /
>> fallocate) as this will significantly speed up moving glocks from one node
>> to another:
>>
>> That would definitely be a step forward.
>>
>>
>>
>> At the moment, data=ordered is implemented by keeping a list of all
>> inodes that did an ordered write. When it comes time to flush the log, the
>> data of all those ordered inodes is flushed first. When all we want is to
>> flush a single glock in order to move it to a different node, we currently
>> flush all the ordered inodes as well as the journal.
>>
>> If we only flushed the ordered data of the glock being moved plus the
>> entire journal, the ordering guarantees for the other ordered inodes in the
>> journal would be violated. In that scenario, unwritten blocks could (and
>> would) show up in files after crashes.
>>
>> If we instead record unwritten blocks in the journal, we'll know which
>> blocks need to be zeroed out at recovery time. Once an unwritten block is
>> written, we record a REVOKE entry for that block.
>>
>> This comes at the cost of tracking those blocks of course, but with that
>> in place, moving a glock from one node to another will only require
>> flushing the underlying inode (assuming it's a inode glock) and the
>> journal. And most likely, we won't have to bother with implementing "simple"
>> transactions as described in
>> https://bugzilla.redhat.com/show_bug.cgi?id=1631499.
>>
>> Thanks,
>> Andreas
>>
>> That would be another way of looking at the problem, yes. It does add a
>> lot to the complexity though, and it doesn't scale very well on systems
>> with large amounts of memory (and therefore potentially lots of unwritten
>> extents to record & keep track of). If there are lots of small
>> transactions, then each one might be significantly expanded by the need to
>> write the info to track the things which have not been written yet.
>>
>> If we keep track of individual allocations/deallocations, as per Abhi's
>> suggestion, then we know where the areas are which may potentially have
>> unwritten data in them. That may allow us to avoid having to do the data
>> writeback ahead of the journal flush in the first place - moving something
>> more towards the XFS way of doing things.
>>
> Well, allocations and unwritten data are essentially the same thing; I may
> not have said that very clearly. So avoiding unnecessary ordered data
> write-out is *exactly* what I'm proposing here. When moving a glock from
> one node to another, we very certainly do want to write out the ordered
> data of that specific inode, however. The problem is that tracking
> allocations is worthless if we don't record one of the following things in
> the journal: either (a) which of the unwritten blocks have been written
> already, or (b) the fact that all unwritten blocks of an inode have been
> written now. When moving a glock from one node to another, (b) may be
> relatively easy to ascertain, but in a running system, we may never reach
> that state.
>

To expand on this a little, fsync is a point at which (b) is achieved, due
to the fact that we don't allow multiple local processes concurrent "EX"
access to a file today. This isn't really a desired property of the
filesystem though; other filesystems allow a lot more concurrency. So
before too long, we might end up in a situation where an fsync only
guarantees that all previous writes will be synced to disk. The resource
group glock sharing is a move in that direction.

Andreas

--0000000000009a94bc05bbec6eeb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Mon, Feb 22, 2021 at 12:41 PM Andreas Gruenbacher &lt;<a href=
=3D"mailto:agruenba@redhat.com">agruenba@redhat.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 22, 2=
021 at 11:21 AM Steven Whitehouse &lt;<a href=3D"mailto:swhiteho@redhat.com=
" target=3D"_blank">swhiteho@redhat.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div>
    <p>Hi,<br>
    </p>
    <div>On 20/02/2021 09:48, Andreas
      Gruenbacher wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
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
    ^^^^ succeeding? (I hope!)<br></div></blockquote><div><br></div><div>No=
, we call lops_before_commit (which writes the various log descriptors, met=
adata, and journaled data blocks) before writing the log header in log_writ=
e_header -&gt; gfs2_write_log_header. In that sense, we could call it a tra=
iler.<br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div>We should change that so that a single log descriptor
          contains a number of records. There should be records for
          METADATA and JDATA blocks that follow, as well as for REVOKES
          and for COMMIT. If a transaction contains metadata and/or
          jdata blocks, those will obviously need a precursor and a
          commit block like today, but we shouldn&#39;t need separate block=
s
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
      infrequently, perhaps not such an important issue.</p></div></blockqu=
ote><div>Journaled data would of course still need to be written. We could =
have a single log descriptor with          METADATA and JDATA records, foll=
owed by the metadata and journaled data blocks, followed by a log descripto=
r with a COMMIT record.<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div>
    <p>
    </p>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div>Right now, we&#39;re writing log headers (&quot;commits&quot;)=
 with
          REQ_PREFLUSH to make sure all the log descriptors of a
          transaction make it to disk before the log header. Depending
          on the device, this is often costly. If we can fit an entire
          transaction into a single block, REQ_PREFLUSH won&#39;t be needed
          anymore.</div>
      </div>
    </blockquote>
    <p>I&#39;m not sure I agree. The purpose of the preflush is to ensure
      that the data and the preceding log blocks are really on disk
      before we write the commit record. That will still be required
      while we use ordered writes, even if we can use (as you suggest
      below) a checksum to cover the whole transaction, and thus check
      for a complete log record after the fact. Also, we would still
      have to issue the flush in the case of a fsync derived log flush
      too.</p>
    <p><br>
    </p>
    <blockquote type=3D"cite">
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
    <blockquote type=3D"cite">
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
        <div>If we instead record unwritten blocks in the journal, we&#39;l=
l
          know which blocks need to be zeroed out at recovery time. Once
          an unwritten block is written, we record a REVOKE entry for
          that block.</div>
        <div><br>
        </div>
        <div>This comes at the cost of tracking those blocks of course,
          but with that in place, moving a glock from one node to
          another will only require flushing the underlying inode
          (assuming it&#39;s a inode glock) and the journal. And most
          likely, we won&#39;t have to bother with implementing <span id=3D=
"gmail-m_-8211396661938468765gmail-m_1849982298399465508gmail-summary_conta=
iner"><span id=3D"gmail-m_-8211396661938468765gmail-m_1849982298399465508gm=
ail-short_desc_nonedit_display">&quot;simple&quot;
              transactions as described in </span></span><a href=3D"https:/=
/bugzilla.redhat.com/show_bug.cgi?id=3D1631499" target=3D"_blank">https://b=
ugzilla.redhat.com/show_bug.cgi?id=3D1631499</a>.<br>
        </div>
        <div><br>
        </div>
        <div>Thanks,</div>
        <div>Andreas<br>
        </div>
      </div>
    </blockquote>
    <p>That would be another way of looking at the problem, yes. It does
      add a lot to the complexity though, and it doesn&#39;t scale very wel=
l
      on systems with large amounts of memory (and therefore potentially
      lots of unwritten extents to record &amp; keep track of). If there
      are lots of small transactions, then each one might be
      significantly expanded by the need to write the info to track the
      things which have not been written yet.</p>
    <p>If we keep track of individual allocations/deallocations, as per
      Abhi&#39;s suggestion, then we know where the areas are which may
      potentially have unwritten data in them. That may allow us to
      avoid having to do the data writeback ahead of the journal flush
      in the first place - moving something more towards the XFS way of
      doing things.</p></div></blockquote><div>Well, allocations and unwrit=
ten data are essentially the same thing; I may not have said that very clea=
rly. So avoiding unnecessary ordered data write-out is *exactly* what I&#39=
;m proposing here. When moving a glock from one node to another, we very ce=
rtainly do want to write out the ordered data of that specific inode, howev=
er. The problem is that tracking allocations is worthless if we don&#39;t r=
ecord one of the following things in the journal: either (a) which of the u=
nwritten blocks have been written already, or (b) the fact that all unwritt=
en blocks of an inode have been written now. When moving a glock from one n=
ode to another, (b) may be relatively easy to ascertain, but in a running s=
ystem, we may never reach that state.</div></div></div></blockquote><div><b=
r></div><div>To expand on this a little, fsync is a point at which (b) is a=
chieved, due to the fact that we don&#39;t allow multiple local processes c=
oncurrent &quot;EX&quot; access to a file today. This isn&#39;t really a de=
sired property of the filesystem though; other filesystems allow a lot more=
 concurrency. So before too long, we might end up in a situation where an f=
sync only guarantees that all previous writes will be synced to disk. The r=
esource group glock sharing is a move in that direction.<br></div><div><br>=
</div>Andreas</div></div>

--0000000000009a94bc05bbec6eeb--

