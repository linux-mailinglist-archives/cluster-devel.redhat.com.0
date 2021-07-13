Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id B74203C7701
	for <lists+cluster-devel@lfdr.de>; Tue, 13 Jul 2021 21:34:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626204885;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=edXKyKgfdI2mtnt9CIukqNYV38lTFdUyr+/TLijM3G4=;
	b=SBsOx4/v1L08eD44V9CPRzTvVUcEVqyGCMyE4GPEgcMH6eemCb9wa2BSrN2LzW3/+kuaCT
	3y5H7srNEDPOTBz6NMrBEaifsp1bcJBNcyYkWcpfVyIqnYvOI7yxCE+JA1gZaLdf/8CrkH
	Qc6LdKb6zX/KQDK51yvo6gazr2aj7iQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-MYGIAJWmPeGmPlPg4Oo6-Q-1; Tue, 13 Jul 2021 15:34:44 -0400
X-MC-Unique: MYGIAJWmPeGmPlPg4Oo6-Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2B9618D6A2E;
	Tue, 13 Jul 2021 19:34:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2206819C45;
	Tue, 13 Jul 2021 19:34:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CC4AD1809C99;
	Tue, 13 Jul 2021 19:34:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16DJYVrF029065 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 13 Jul 2021 15:34:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 72AD02126C93; Tue, 13 Jul 2021 19:34:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E4772138BCD
	for <cluster-devel@redhat.com>; Tue, 13 Jul 2021 19:34:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C7211078460
	for <cluster-devel@redhat.com>; Tue, 13 Jul 2021 19:34:28 +0000 (UTC)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
	[209.85.166.199]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-576-xFMeJdISNl6k686RqBqPBg-1; Tue, 13 Jul 2021 15:34:26 -0400
X-MC-Unique: xFMeJdISNl6k686RqBqPBg-1
Received: by mail-il1-f199.google.com with SMTP id
	a7-20020a9233070000b02901edc50cdfdcso15443796ilf.19
	for <cluster-devel@redhat.com>; Tue, 13 Jul 2021 12:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=edXKyKgfdI2mtnt9CIukqNYV38lTFdUyr+/TLijM3G4=;
	b=UunWUDdy5Ogko2gtttsTRzXxtaaIedhBXDnjLm+cXlmmAE5PbulAp6/cKdStzPhhS4
	X0Jopo9/9yRM3KegV63IsfVHNg6+/UxWreBt8svAf+aQJIsJ6kNj+Z2KTMvx1OkH/wh8
	MZWBip0FcEIXgC4oYs76QQARAsbU4yQNB3HuX4q4Qx5vPeZVz3IzaNiN9uMCm1zPrXDQ
	rAPwqCGgKD1HC/CnvoLzuKxM4etqtWKh+lgmKKTP0i3ewWCTe1NjfY48zAhKwtmam77i
	3tK6g5hC/snxRQbLuMKsTYZnlGnfWl2+ZaDBOC1Qm8vVbiQHTfxWWBuSnPoEVswLtszJ
	j/WQ==
X-Gm-Message-State: AOAM532MjyJt6/UKdH4qqwuwG4gNtx/XykujY6YO1CV/22ysAXS6rZ3t
	xrdXqq3eZK4/GOMZICvvK+MwB3ML/PD2A5NdZ7Yw8eNDG0GQNZNGZSjeQitq+TDsTEACePBVBqM
	dIokQWEHuhB0sNlD60/gQmaR+w7jSg17hzsuydgZWTiHTy4r8MLoVPXhuI85G3rEWh23NNiWMdQ
	==
X-Received: by 2002:a05:6638:248d:: with SMTP id
	x13mr5461857jat.78.1626204865788; 
	Tue, 13 Jul 2021 12:34:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysKFzHIQGgQm09WI5FjtvXAIEeunj1GyDI6ohoz6xykctyhlN5PLMf/CLWTlUjJVbnSfntFg==
X-Received: by 2002:a05:6638:248d:: with SMTP id
	x13mr5461840jat.78.1626204865587; 
	Tue, 13 Jul 2021 12:34:25 -0700 (PDT)
Received: from [172.16.0.19] (209-212-39-192.brainerd.net. [209.212.39.192])
	by smtp.gmail.com with ESMTPSA id
	g20sm10646702ilk.81.2021.07.13.12.34.24
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 13 Jul 2021 12:34:25 -0700 (PDT)
To: Steven Whitehouse <swhiteho@redhat.com>,
	cluster-devel <cluster-devel@redhat.com>
References: <20210713180958.66995-1-rpeterso@redhat.com>
	<20210713180958.66995-11-rpeterso@redhat.com>
	<34e7b795c97d781b8788d965dd7caf48d8b8ec24.camel@redhat.com>
From: Bob Peterson <rpeterso@redhat.com>
Message-ID: <76779e30-76b3-b867-7d1c-46a96b56a741@redhat.com>
Date: Tue, 13 Jul 2021 14:34:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <34e7b795c97d781b8788d965dd7caf48d8b8ec24.camel@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [GFS2 PATCH 10/10] gfs2: replace sd_aspace with
 sd_inode
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
	boundary="------------BADFACCC1A3F6E17DDA008C5"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------BADFACCC1A3F6E17DDA008C5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/13/21 1:26 PM, Steven Whitehouse wrote:
> Hi,
>
> On Tue, 2021-07-13 at 13:09 -0500, Bob Peterson wrote:
>> Before this patch, gfs2 kept its own address space for rgrps, but
>> this
>> caused a lockdep problem because vfs assumes a 1:1 relationship
>> between
>> address spaces and their inode. One problematic area is this:
>>
> I don't think that is the case. The reason that the address space is a
> separate structure in the first place is to allow them to exist without
> an inode. Maybe that has changed, but we should see why that is, in
> that case rather than just making this change immediately.
>
> I can't see any reason why if we have to have an inode here that it
> needs to be hashed... what would need to look it up via the hashes?
>
> Steve.
>
Hi,

The actual use case, which is easily demonstrated with lockdep, is given
in the patch text shortly after where you placed your comment. This goes
back to this discussion from April 2018:

https://listman.redhat.com/archives/cluster-devel/2018-April/msg00017.html

in which Jan Kara pointed out that:

"The problem is we really do expect mapping->host->i_mapping == mapping as
we pass mapping and inode interchangebly in the mm code. The address_space
and inodes are separate structures because you can have many inodes
pointing to one address space (block devices). However it is not allowed
for several address_spaces to point to one inode!"

Regards,

Bob Peterson



--------------BADFACCC1A3F6E17DDA008C5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/13/21 1:26 PM, Steven Whitehouse
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:34e7b795c97d781b8788d965dd7caf48d8b8ec24.camel@redhat.com">
      <pre class="moz-quote-pre" wrap="">Hi,

On Tue, 2021-07-13 at 13:09 -0500, Bob Peterson wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Before this patch, gfs2 kept its own address space for rgrps, but
this
caused a lockdep problem because vfs assumes a 1:1 relationship
between
address spaces and their inode. One problematic area is this:

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">I don't think that is the case. The reason that the address space is a
separate structure in the first place is to allow them to exist without
an inode. Maybe that has changed, but we should see why that is, in
that case rather than just making this change immediately.

I can't see any reason why if we have to have an inode here that it
needs to be hashed... what would need to look it up via the hashes?

Steve.

</pre>
    </blockquote>
    <p>Hi,</p>
    <p>The actual use case, which is easily demonstrated with lockdep,
      is given<br>
      in the patch text shortly after where you placed your comment.
      This goes<br>
      back to this discussion from April 2018:</p>
    <p><a class="moz-txt-link-freetext" href="https://listman.redhat.com/archives/cluster-devel/2018-April/msg00017.html">https://listman.redhat.com/archives/cluster-devel/2018-April/msg00017.html</a><br>
    </p>
    <p>in which Jan Kara pointed out that:</p>
    <pre>"The problem is we really do expect mapping-&gt;host-&gt;i_mapping == mapping as
we pass mapping and inode interchangebly in the mm code. The address_space
and inodes are separate structures because you can have many inodes
pointing to one address space (block devices). However it is not allowed
for several address_spaces to point to one inode!"</pre>
    <p>Regards,</p>
    <p>Bob Peterson</p>
    <p><br>
    </p>
  </body>
</html>

--------------BADFACCC1A3F6E17DDA008C5--

