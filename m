Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 45EBF3204D0
	for <lists+cluster-devel@lfdr.de>; Sat, 20 Feb 2021 10:49:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613814554;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=XkYzuKk0A3V+LCDu4W2Khg6G5xAbFCn/MOUomM9SII4=;
	b=DxT8NintrOJdgVPLW2UFnqCBzGZhXqF09S4oE0NP3C7RW8AcWZg/KFSE2yc7tqYBd1YAzu
	hheFivSmd+Q8DhLt6EU99w07rANsCoNYQIfxaWC3g3MYMTN5DeDEjYdrEQCDvC6J3tBZZE
	7WBlHf/TFFMNelw9CKSwZS2DVxBHwos=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-BSv7rL2HNCGa6m4718i9ig-1; Sat, 20 Feb 2021 04:49:11 -0500
X-MC-Unique: BSv7rL2HNCGa6m4718i9ig-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 190EC107ACE3;
	Sat, 20 Feb 2021 09:49:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 992AD6685F;
	Sat, 20 Feb 2021 09:49:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ED16D18095CB;
	Sat, 20 Feb 2021 09:49:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11K9n1DX003656 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 20 Feb 2021 04:49:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E46F32026D13; Sat, 20 Feb 2021 09:49:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DEDED2026D46
	for <cluster-devel@redhat.com>; Sat, 20 Feb 2021 09:48:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C05031859196
	for <cluster-devel@redhat.com>; Sat, 20 Feb 2021 09:48:58 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
	[209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-148-vO8cF6GnMxOf-_pZgW9hsw-1; Sat, 20 Feb 2021 04:48:56 -0500
X-MC-Unique: vO8cF6GnMxOf-_pZgW9hsw-1
Received: by mail-wr1-f70.google.com with SMTP id x14so3062386wrr.13
	for <cluster-devel@redhat.com>; Sat, 20 Feb 2021 01:48:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XkYzuKk0A3V+LCDu4W2Khg6G5xAbFCn/MOUomM9SII4=;
	b=byMmyMvam5ixgxaQJLMcAYHGgIJCcGorReLDZkkNIfVdCr3n8AWcFF9BFYu8qo+KMM
	ZRQfTCZ1/1HRifZpB4Q0V8Wf2Exblkf+edAv0gwDSlM0q+ECuCenXfmgvvDBJuFs9i0N
	ZCcpsc4BEAHGNoHU+eRi74+/tzk+SEseM77xaiIGzN0IKksov43PlFrKPtUux+c9Q85F
	+joYm5yLx/jn7fT64hll81L8Mj7Lz7OOr+O9ogOFRcT2Nk4VuJwMrv+QucuS+O+5PFp9
	29AEm/5BbePFmcZ1TUzNZLvFuU24/On0w00526mh8joJfoPsgE3Zi+KprlAKyZS8uUup
	0UpQ==
X-Gm-Message-State: AOAM530NNLcEg85JmW+DLMVFnm0wqZvnMCoTjqnaBReQtkAfFR6kF3q0
	Qfcx9Bdppx/GK7MJmwu9r8e8ChZkzNVrAsKBhvioBHMHnepAeW0ULPnWCapSn//pIceqL2P9PjX
	OeSuYfjGegoDUNvewnsGVXnyBvZAoxfqvxvoOlg==
X-Received: by 2002:a05:600c:4fcf:: with SMTP id
	o15mr12004279wmq.96.1613814534758; 
	Sat, 20 Feb 2021 01:48:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzA77ZYtFXZocTLlCL8hItUnXf8NTqf3OUlzWbicqBD7bjwt4YzfKHT4wLme8ImB8S9AyLwLkYnWllYyKe0bW4=
X-Received: by 2002:a05:600c:4fcf:: with SMTP id
	o15mr12004264wmq.96.1613814534599; 
	Sat, 20 Feb 2021 01:48:54 -0800 (PST)
MIME-Version: 1.0
References: <CACrDRjiiXtz6cOO8FmnZHKte2EVKAFzDESXJ5a8oALd7h+EizA@mail.gmail.com>
	<CACrDRjjOgEsqOSWK1PeMro4WQxKkmR=KEfCCRQzBGCwtY+fevQ@mail.gmail.com>
	<93452e4c-af81-225f-34f5-f297473164ae@redhat.com>
In-Reply-To: <93452e4c-af81-225f-34f5-f297473164ae@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Sat, 20 Feb 2021 10:48:42 +0100
Message-ID: <CAHc6FU6jQ3KGgKgQHy_WaX-40nqWxGbJNqmAcSFtJPweR7AtQg@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000011890805bbc17a21"

--00000000000011890805bbc17a21
Content-Type: text/plain; charset="UTF-8"

Hi all,

once we change the journal format, in addition to recording block numbers
as extents, there are some additional issues we should address at the same
time:

I. The current transaction format of our journals is as follows:

   - One METADATA log descriptor block for each [503 / 247 / 119 / 55]
   metadata blocks, followed by those metadata blocks. For each metadata
   block, the log descriptor records the 64-bit block number.
   - One JDATA log descriptor block for each [251 / 123 / 59 / 27] metadata
   blocks, followed by those metadata blocks. For each metadata block, the log
   descriptor records the 64-bit block number and another 64-bit field for
   indicating whether the block needed escaping.
   - One REVOKE log descriptor block for the initial [503 / 247 / 119 / 55]
   revokes, followed by a metadata header (not to be confused with the log
   header) for each additional [509 / 253 / 125 / 61] revokes. Each revoke is
   recorded as a 64-bit block number in its REVOKE log descriptor or metadata
   header.
   - One log header with various necessary and useful metadata that acts as
   a COMMIT record. If the log header is incorrect or missing, the preceding
   log descriptors are ignored.

We should change that so that a single log descriptor contains a number of
records. There should be records for METADATA and JDATA blocks that follow,
as well as for REVOKES and for COMMIT. If a transaction contains metadata
and/or jdata blocks, those will obviously need a precursor and a commit
block like today, but we shouldn't need separate blocks for metadata and
journaled data in many cases. Small transactions that only consist of
revokes and of a commit should frequently fit into a single block entirely,
though.

Right now, we're writing log headers ("commits") with REQ_PREFLUSH to make
sure all the log descriptors of a transaction make it to disk before the
log header. Depending on the device, this is often costly. If we can fit an
entire transaction into a single block, REQ_PREFLUSH won't be needed
anymore.

III. We could also checksum entire transactions to avoid REQ_PREFLUSH. At
replay time, all the blocks that make up a transaction will either be there
and the checksum will match, or the transaction will be invalid. This
should be less prohibitively expensive with CPU support for CRC32C
nowadays, but depending on the hardware, it may make sense to turn this off.

IV. We need recording of unwritten blocks / extents (allocations /
fallocate) as this will significantly speed up moving glocks from one node
to another:

At the moment, data=ordered is implemented by keeping a list of all inodes
that did an ordered write. When it comes time to flush the log, the data of
all those ordered inodes is flushed first. When all we want is to flush a
single glock in order to move it to a different node, we currently flush
all the ordered inodes as well as the journal.

If we only flushed the ordered data of the glock being moved plus the
entire journal, the ordering guarantees for the other ordered inodes in the
journal would be violated. In that scenario, unwritten blocks could (and
would) show up in files after crashes.

If we instead record unwritten blocks in the journal, we'll know which
blocks need to be zeroed out at recovery time. Once an unwritten block is
written, we record a REVOKE entry for that block.

This comes at the cost of tracking those blocks of course, but with that in
place, moving a glock from one node to another will only require flushing
the underlying inode (assuming it's a inode glock) and the journal. And
most likely, we won't have to bother with implementing "simple"
transactions as described in
https://bugzilla.redhat.com/show_bug.cgi?id=1631499.

Thanks,
Andreas

--00000000000011890805bbc17a21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<br><br>once we change the journal format, in addit=
ion to recording block numbers as extents, there are some additional issues=
 we should address at the same time:<br><br>I. The current transaction form=
at of our journals is as follows:<br><div></div><ul><li>One METADATA log de=
scriptor block for each [503 / 247 / 119 / 55] metadata blocks, followed by=
 those metadata blocks. For each metadata block, the log descriptor records=
 the 64-bit block number.</li><li>One JDATA log descriptor block for each [=
251 / 123 / 59 / 27] metadata blocks, followed by those metadata blocks. Fo=
r each metadata block, the log descriptor records the 64-bit block number a=
nd another 64-bit field for indicating whether the block needed escaping.</=
li><li>One REVOKE log descriptor block for the initial [503 / 247 / 119 / 5=
5] revokes, followed by a metadata header (not to be confused with the log =
header) for each additional [509 / 253 / 125 / 61] revokes. Each revoke is =
recorded as a 64-bit block number in its REVOKE log descriptor or metadata =
header.</li><li>One log header with various necessary and useful metadata t=
hat acts as a COMMIT record. If the log header is incorrect or missing, the=
 preceding log descriptors are ignored.<br></li></ul><div>We should change =
that so that a single log descriptor contains a number of records. There sh=
ould be records for METADATA and JDATA blocks that follow, as well as for R=
EVOKES and for COMMIT. If a transaction contains metadata and/or jdata bloc=
ks, those will obviously need a precursor and a commit block like today, bu=
t we shouldn&#39;t need separate blocks for metadata and journaled data in =
many cases. Small transactions that only consist of revokes and of a commit=
 should frequently fit into a single block entirely, though.</div><div><br>=
</div><div>Right now, we&#39;re writing log headers (&quot;commits&quot;) w=
ith REQ_PREFLUSH to make sure all the log descriptors of a transaction make=
 it to disk before the log header. Depending on the device, this is often c=
ostly. If we can fit an entire transaction into a single block, REQ_PREFLUS=
H won&#39;t be needed anymore.</div><div><br></div><div>III. We could also =
checksum entire transactions to avoid REQ_PREFLUSH. At replay time, all the=
 blocks that make up a transaction will either be there and the checksum wi=
ll match, or the transaction will be invalid. This should be less prohibiti=
vely expensive with CPU support for CRC32C nowadays, but depending on the h=
ardware, it may make sense to turn this off.<br></div><div><br></div><div>I=
V. We need recording of unwritten blocks / extents (allocations / fallocate=
) as this will significantly speed up moving glocks from one node to anothe=
r:</div><div><br></div><div></div><div>At the moment, data=3Dordered is imp=
lemented by keeping a list of all inodes that did an ordered write. When it=
 comes time to flush the log, the data of all those ordered inodes is flush=
ed first. When all we want is to flush a single glock in order to move it t=
o a different node, we currently flush all the ordered inodes as well as th=
e journal.</div><div><br></div><div>If we only flushed the ordered data of =
the glock being moved plus the entire journal, the ordering guarantees for =
the other ordered inodes in the journal would be violated. In that scenario=
, unwritten blocks could (and would) show up in files after crashes.<br></d=
iv><div></div><div><br></div><div>If we instead record unwritten blocks in =
the journal, we&#39;ll know which blocks need to be zeroed out at recovery =
time. Once an unwritten block is written, we record a REVOKE entry for that=
 block.</div><div><br></div><div>This comes at the cost of tracking those b=
locks of course, but with that in place, moving a glock from one node to an=
other will only require flushing the underlying inode (assuming it&#39;s a =
inode glock) and the journal. And most likely, we won&#39;t have to bother =
with implementing <span id=3D"gmail-summary_container"><span id=3D"gmail-sh=
ort_desc_nonedit_display">&quot;simple&quot; transactions as described in <=
/span></span><a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D16314=
99">https://bugzilla.redhat.com/show_bug.cgi?id=3D1631499</a>.<br></div><di=
v><br></div><div>Thanks,</div><div>Andreas<br></div></div>

--00000000000011890805bbc17a21--

