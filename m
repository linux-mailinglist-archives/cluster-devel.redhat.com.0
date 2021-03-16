Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0CF8733DCA9
	for <lists+cluster-devel@lfdr.de>; Tue, 16 Mar 2021 19:37:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615919840;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=t5YqyfxZotuF+YLVddV1sn/87w94ZejnR1oaNXDlsZg=;
	b=HahT58oNKF3gWfzHbVdBnh4OhWFeLyccEwnCRG8gzs6g8u0vZ3q5wfgVV9/ZsPFRl0atwG
	IpfL4SCiwWWwiC91gdV9g8SqDaTUuviZNKdGfE00IwM9NsRc1crYL/yF8WkE+016Zmdz2a
	/vBiuUqEE5nti28AgFKMvGlpxslOmhs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-smRlX1IsNBeG1w9rOkyXKg-1; Tue, 16 Mar 2021 14:37:18 -0400
X-MC-Unique: smRlX1IsNBeG1w9rOkyXKg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6BB6363A8;
	Tue, 16 Mar 2021 18:37:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB5A560875;
	Tue, 16 Mar 2021 18:37:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 20CA818006D9;
	Tue, 16 Mar 2021 18:37:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12GIb8gU019272 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 16 Mar 2021 14:37:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3D24760C0F; Tue, 16 Mar 2021 18:37:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from ovpn-112-197.ams2.redhat.com (ovpn-112-197.ams2.redhat.com
	[10.36.112.197])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B782F60C13;
	Tue, 16 Mar 2021 18:37:03 +0000 (UTC)
Message-ID: <ff7b25011a930e3d9f2f2bd17ed39bbc025257b7.camel@redhat.com>
From: Paolo Abeni <pabeni@redhat.com>
To: Alexander Ahring Oder Aring <aahringo@redhat.com>
Date: Tue, 16 Mar 2021 19:37:02 +0100
In-Reply-To: <CAK-6q+hueOPUSUpCM2ksfgtNPB9HSvSy9HLUZvLPi+g9v0Cmiw@mail.gmail.com>
References: <20210310191745.80824-1-aahringo@redhat.com>
	<7536fa5a3661675c583a448cf1bbc3f026bfea23.camel@redhat.com>
	<CAK-6q+hueOPUSUpCM2ksfgtNPB9HSvSy9HLUZvLPi+g9v0Cmiw@mail.gmail.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Guillaume Nault <gnault@redhat.com>
Subject: Re: [Cluster-devel] [PATCHv2 dlm/next 0/8] fs: dlm: introduce dlm
 re-transmission layer
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello,

On Fri, 2021-03-12 at 09:52 -0500, Alexander Ahring Oder Aring wrote:
> On Thu, Mar 11, 2021 at 4:09 AM Paolo Abeni <pabeni@redhat.com> wrote:
> > - DEFAULT_BUFFER_SIZE == LOWCOMMS_MAX_TX_BUFFER_LEN in current net-
> > next, so looks like a change below is actually a no op ?!?
> 
> It's LOWCOMMS_MAX_TX_BUFFER_LEN updated in patch 7/8:
> 
> #define LOWCOMMS_MAX_TX_BUFFER_LEN     (DEFAULT_BUFFER_SIZE -
> DLM_MIDCOMMS_OPT_LEN)
> 
> whereas DEFAULT_BUFFER_SIZE is the maximum possible dlm message size
> at socket layer level. Mainly this is limited because we can get a
> maximum page buffer allocation for the dlm application layer only and
> the application layer cannot deal with any additional logic to handle
> more. However that is also an architecture thing, because it needs to
> be the minimal page buffer size of all architecture due compatibility
> with other architectures. I introduced a check which should report
> problems if architectures doesn't support it:
> 
> BUILD_BUG_ON(PAGE_SIZE < DEFAULT_BUFFER_SIZE);
> 
> LOWCOMMS_MAX_TX_BUFFER_LEN is the length after the encapsulation
> header, the size "what the dlm application layer can maximum put in a
> message" on application layer level.
> 
> The names are misnamed, it's on my list to update them. Any
> recommendations (MAX_DLM_SOCKET_BUFFER_SIZE/MAX_DLM_APP_BUFFER_SIZE)?

I'm almost literaly the last person to ask this kind of questions, as I
always pick up bad names... I would opt for:

DLM_MAX_SOCKET_BUFSIZE
DLM_MAX_APP_BUFSIZE

> > - Could you please add more info WRT the reference to unaligned memory
> > access in the code comments? Which field[s] is[are] subject to that?
> > 
> 
> none of these fields. Some of the DLM messages have a variable sized
> payload at the tail. It's a string value. This string length needs to
> be 8 byte aligned. The kernel violate this, however there exists an
> userspace API and the user needs to define this string value. One user
> is lvm, lvm uses an unique identifier the UUID of the volume for this
> string value, the UUID string value is 36 chars. It will end in a
> message boundary issue which will/can end in unaligned memory access
> at the sending side (because of some internal buffer handling) and the
> receiving side. I tried to fix it by filling zero bytes to this string
> but the problem is more complicated as David Teigland pointed out to
> still have backwards compatibility. I would like to schedule to fix
> the issue in a next major version bump of dlm.

Uhm... It looks like the unaligned access was partially handled with
memmove/put_unaligned, but that code was removed with
commit df9e06b800ed025411ce9ab348299b3ef258cf8b - because the removed
code did not cover all the use-case.

I guess a complete solution based on get_unaligned/put_unaligned is too
invasive?

I'm not sure I follow correctly when you says the issue should be
solved on the send side... What if a sender is buggy/uses an old
implementation? would that cause unaligned access?

If a message is unaligned, will it stay unaligned on re-transmissions?
Otherwise, if the unaligned messages are really a corner case, given
that this implements app-layer retransmission, what about simply
detecting the unaligned message and dropping it? It sounds a bit
scaring to me that a remote peer would be able to trigger an oops (on
some arches) with a badly crafted packet.

It looks like the amount of memory the 'receive_queue' and 'send_queue'
can use is still unbounded ?!? I suggest to drop at least a commend
about why that should not be an issue (if that is really not a problem
;)

I had also an additional minor comment on patch 7/8, see there for the
details...

Cheers,

Paolo


