Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2E895321548
	for <lists+cluster-devel@lfdr.de>; Mon, 22 Feb 2021 12:42:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613994134;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=YzRmehbcR/HpdVCyFc6AeGdfLzeUhao+sBy0GWuIoo4=;
	b=S+vDlOSnNRBskq9eoEQlUdeYqELaAw99otdZCcw98tSPVbHzRx+aj/y47ftfNKuvJoH4Vd
	OPLlJ6mcP/kLTRvzhqfplv/O53RXfsmZJh3E4s5m7rcTfn8+lsuPpdoY+DP4FALHw43RuB
	6l/rkDDA/WcGH01ss8Gqenv5BsQE4cY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-BeFvUoJDM7KlTgjHualzAg-1; Mon, 22 Feb 2021 06:42:12 -0500
X-MC-Unique: BeFvUoJDM7KlTgjHualzAg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96AF0801965;
	Mon, 22 Feb 2021 11:42:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C1EC5D9CC;
	Mon, 22 Feb 2021 11:42:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 89BA418095CC;
	Mon, 22 Feb 2021 11:42:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11MBg15O016305 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 22 Feb 2021 06:42:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0D01D202A422; Mon, 22 Feb 2021 11:42:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07121202A420
	for <cluster-devel@redhat.com>; Mon, 22 Feb 2021 11:41:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 932DD9291A5
	for <cluster-devel@redhat.com>; Mon, 22 Feb 2021 11:41:58 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
	[209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-350-Rv8a2ljqPFeHSdaQFC8nTA-1; Mon, 22 Feb 2021 06:41:56 -0500
X-MC-Unique: Rv8a2ljqPFeHSdaQFC8nTA-1
Received: by mail-wm1-f71.google.com with SMTP id h20so439166wmq.9
	for <cluster-devel@redhat.com>; Mon, 22 Feb 2021 03:41:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YzRmehbcR/HpdVCyFc6AeGdfLzeUhao+sBy0GWuIoo4=;
	b=aVFtO92Jubwt6Gm0dHU9MLgsO8cRWHSBVDTYeOwbJqTSKm894R/HnpYpnsaRQMAFkF
	nkD6vOM7o33PpB/Zh5L6OPwK2JjnAsxBvviWhrqlGlw/bPIL6glmZkPT5G0K2K5S5lmK
	EGTcm+3dWY/jtQ2PPu3iYdPfA9lCkgbcqikKZ0vFrUgPLgADu19JqWeFmDI3GLABqQc0
	UraU5fuzAkrZmZYQ3BBLNJyQ3Q9HuRbFdJxH71GtFQX+SPPMepuzfSo2hYdl+pVn0MyG
	9Sw/fxdEJT2DGByO24ZU6xxVGhEa6p0uLDL0Dn+iflkcuxyTLb3JlpbOWZG2eMaFA7wc
	Gi4w==
X-Gm-Message-State: AOAM531bcmeBK56/HGEvZixvST74CYEf1PrwIxpEWEXnZu7ZDa9LaXS+
	qemmP9qn9V7ywnpculG1dTByNdLKfRHOsYVLik2mhUNaz+/YaBkSrUQyXZqbRnieGJj/0U7Gc2i
	MR8L+l2ejEvXfarLiOnTBGsJpfUUH/3T/KFWrkA==
X-Received: by 2002:a05:600c:2652:: with SMTP id
	18mr6459920wmy.96.1613994115249; 
	Mon, 22 Feb 2021 03:41:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJybbb4QhUkJSWfQYuNByzX//xiI3kDuAVkHsFH2AVMP/xrXaa1mLnFmGwW/Z+8A0hnr0DIJllbyRr5hPfs/ss4=
X-Received: by 2002:a05:600c:2652:: with SMTP id
	18mr6459899wmy.96.1613994114992; 
	Mon, 22 Feb 2021 03:41:54 -0800 (PST)
MIME-Version: 1.0
References: <CACrDRjiiXtz6cOO8FmnZHKte2EVKAFzDESXJ5a8oALd7h+EizA@mail.gmail.com>
	<CACrDRjjOgEsqOSWK1PeMro4WQxKkmR=KEfCCRQzBGCwtY+fevQ@mail.gmail.com>
	<93452e4c-af81-225f-34f5-f297473164ae@redhat.com>
	<CAHc6FU6jQ3KGgKgQHy_WaX-40nqWxGbJNqmAcSFtJPweR7AtQg@mail.gmail.com>
	<cd213bd4-3bc0-bb8f-0e8f-de2a26a62731@redhat.com>
In-Reply-To: <cd213bd4-3bc0-bb8f-0e8f-de2a26a62731@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 22 Feb 2021 12:41:43 +0100
Message-ID: <CAHc6FU4C1FaLjxZmz5USHS+Nruthto4WYhxqkW0wjB_h8tX6=g@mail.gmail.com>
To: Steven Whitehouse <swhiteho@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000e4ddbc05bbeb4971"

--000000000000e4ddbc05bbeb4971
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 22, 2021 at 11:21 AM Steven Whitehouse <swhiteho@redhat.com>
wrote:

> Hi,
> On 20/02/2021 09:48, Andreas Gruenbacher wrote:
>
> Hi all,
>
> once we change the journal format, in addition to recording block numbers
> as extents, there are some additional issues we should address at the same
> time:
>
> I. The current transaction format of our journals is as follows:
>
>    - One METADATA log descriptor block for each [503 / 247 / 119 / 55]
>    metadata blocks, followed by those metadata blocks. For each metadata
>    block, the log descriptor records the 64-bit block number.
>    - One JDATA log descriptor block for each [251 / 123 / 59 / 27]
>    metadata blocks, followed by those metadata blocks. For each metadata
>    block, the log descriptor records the 64-bit block number and another
>    64-bit field for indicating whether the block needed escaping.
>    - One REVOKE log descriptor block for the initial [503 / 247 / 119 /
>    55] revokes, followed by a metadata header (not to be confused with the log
>    header) for each additional [509 / 253 / 125 / 61] revokes. Each revoke is
>    recorded as a 64-bit block number in its REVOKE log descriptor or metadata
>    header.
>    - One log header with various necessary and useful metadata that acts
>    as a COMMIT record. If the log header is incorrect or missing, the
>    preceding log descriptors are ignored.
>
>                                                                   ^^^^
> succeeding? (I hope!)
>

No, we call lops_before_commit (which writes the various log descriptors,
metadata, and journaled data blocks) before writing the log header in
log_write_header -> gfs2_write_log_header. In that sense, we could call it
a trailer.

We should change that so that a single log descriptor contains a number of
> records. There should be records for METADATA and JDATA blocks that follow,
> as well as for REVOKES and for COMMIT. If a transaction contains metadata
> and/or jdata blocks, those will obviously need a precursor and a commit
> block like today, but we shouldn't need separate blocks for metadata and
> journaled data in many cases. Small transactions that only consist of
> revokes and of a commit should frequently fit into a single block entirely,
> though.
>
> Yes, it makes sense to try and condense what we are writing. Why would we
> not need to have separate blocks for journaled data though? That one seems
> difficult to avoid, and since it is used so infrequently, perhaps not such
> an important issue.
>
Journaled data would of course still need to be written. We could have a
single log descriptor with METADATA and JDATA records, followed by the
metadata and journaled data blocks, followed by a log descriptor with a
COMMIT record.

> Right now, we're writing log headers ("commits") with REQ_PREFLUSH to make
> sure all the log descriptors of a transaction make it to disk before the
> log header. Depending on the device, this is often costly. If we can fit an
> entire transaction into a single block, REQ_PREFLUSH won't be needed
> anymore.
>
> I'm not sure I agree. The purpose of the preflush is to ensure that the
> data and the preceding log blocks are really on disk before we write the
> commit record. That will still be required while we use ordered writes,
> even if we can use (as you suggest below) a checksum to cover the whole
> transaction, and thus check for a complete log record after the fact. Also,
> we would still have to issue the flush in the case of a fsync derived log
> flush too.
>
>
>
> III. We could also checksum entire transactions to avoid REQ_PREFLUSH. At
> replay time, all the blocks that make up a transaction will either be there
> and the checksum will match, or the transaction will be invalid. This
> should be less prohibitively expensive with CPU support for CRC32C
> nowadays, but depending on the hardware, it may make sense to turn this off.
>
> IV. We need recording of unwritten blocks / extents (allocations /
> fallocate) as this will significantly speed up moving glocks from one node
> to another:
>
> That would definitely be a step forward.
>
>
>
> At the moment, data=ordered is implemented by keeping a list of all inodes
> that did an ordered write. When it comes time to flush the log, the data of
> all those ordered inodes is flushed first. When all we want is to flush a
> single glock in order to move it to a different node, we currently flush
> all the ordered inodes as well as the journal.
>
> If we only flushed the ordered data of the glock being moved plus the
> entire journal, the ordering guarantees for the other ordered inodes in the
> journal would be violated. In that scenario, unwritten blocks could (and
> would) show up in files after crashes.
>
> If we instead record unwritten blocks in the journal, we'll know which
> blocks need to be zeroed out at recovery time. Once an unwritten block is
> written, we record a REVOKE entry for that block.
>
> This comes at the cost of tracking those blocks of course, but with that
> in place, moving a glock from one node to another will only require
> flushing the underlying inode (assuming it's a inode glock) and the
> journal. And most likely, we won't have to bother with implementing "simple"
> transactions as described in
> https://bugzilla.redhat.com/show_bug.cgi?id=1631499.
>
> Thanks,
> Andreas
>
> That would be another way of looking at the problem, yes. It does add a
> lot to the complexity though, and it doesn't scale very well on systems
> with large amounts of memory (and therefore potentially lots of unwritten
> extents to record & keep track of). If there are lots of small
> transactions, then each one might be significantly expanded by the need to
> write the info to track the things which have not been written yet.
>
> If we keep track of individual allocations/deallocations, as per Abhi's
> suggestion, then we know where the areas are which may potentially have
> unwritten data in them. That may allow us to avoid having to do the data
> writeback ahead of the journal flush in the first place - moving something
> more towards the XFS way of doing things.
>
Well, allocations and unwritten data are essentially the same thing; I may
not have said that very clearly. So avoiding unnecessary ordered data
write-out is *exactly* what I'm proposing here. When moving a glock from
one node to another, we very certainly do want to write out the ordered
data of that specific inode, however. The problem is that tracking
allocations is worthless if we don't record one of the following things in
the journal: either (a) which of the unwritten blocks have been written
already, or (b) the fact that all unwritten blocks of an inode have been
written now. When moving a glock from one node to another, (b) may be
relatively easy to ascertain, but in a running system, we may never reach
that state.

If we don't "revoke" unwritten blocks some time soon after they are written
(i.e., mark allocated blocks as written), recovery will have no way of
knowing which of the newly allocated blocks to wipe out.

> We would have to ensure that we did get data written back before the
> allocation records vanish from the active part of the log though, so a
> slightly different constraint to currently,
>
Indeed.

Thanks,
Andreas

--000000000000e4ddbc05bbeb4971
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, Feb 22, 2021 at 11:21 AM Steven Whitehouse &lt;<a href=3D"ma=
ilto:swhiteho@redhat.com">swhiteho@redhat.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
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
"gmail-m_1849982298399465508gmail-summary_container"><span id=3D"gmail-m_18=
49982298399465508gmail-short_desc_nonedit_display">&quot;simple&quot;
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
ystem, we may never reach that state.</div><div><br></div><div></div><div>I=
f we don&#39;t &quot;revoke&quot; unwritten blocks some time soon after the=
y are written (i.e., mark allocated blocks as written), recovery will have =
no way of knowing which of the newly allocated blocks to wipe out.<br></div=
><div></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><p>We wo=
uld have to ensure that we did get data written
      back before the allocation records vanish from the active part of
      the log though, so a slightly different constraint to currently,<br><=
/p></div></blockquote><div>Indeed.<br></div><div><br></div><div>Thanks,</di=
v><div>Andreas<br></div></div></div>

--000000000000e4ddbc05bbeb4971--

