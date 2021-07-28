Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8B23C3D96D1
	for <lists+cluster-devel@lfdr.de>; Wed, 28 Jul 2021 22:35:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627504548;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LjiLMLKMxsfIcnUNTlIQe7tETNUMfIZAXgM8SPR00cc=;
	b=IS6F/VUzqFX5pnhPiX6K/zgBON1oBZeBXdSUtrh969tH0JLtVsAisOoX8tQ/uI8YqeSasY
	bcWKWP+PvRjRT1TvOLigOYAqDKFaE7gROd89nyfpLXgTS5hpkoi+bJKPcJvpb/mrPnuRog
	JZzvSojMS/ehTwp9uW2Q+Jay5vJ/2B0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-UMo7rRkXNraPeM3tbONVZw-1; Wed, 28 Jul 2021 16:35:47 -0400
X-MC-Unique: UMo7rRkXNraPeM3tbONVZw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8B51185302A;
	Wed, 28 Jul 2021 20:35:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FC9460C9F;
	Wed, 28 Jul 2021 20:35:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 457D54A7C8;
	Wed, 28 Jul 2021 20:35:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16SKX3aB028593 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 28 Jul 2021 16:33:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D31CEDAF21; Wed, 28 Jul 2021 20:33:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CEE75DAF05
	for <cluster-devel@redhat.com>; Wed, 28 Jul 2021 20:33:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B9E418A0160
	for <cluster-devel@redhat.com>; Wed, 28 Jul 2021 20:33:00 +0000 (UTC)
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
	[209.85.166.200]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-225-UJfiWGh9PS2FJ3Wze28o7w-1; Wed, 28 Jul 2021 16:32:58 -0400
X-MC-Unique: UJfiWGh9PS2FJ3Wze28o7w-1
Received: by mail-il1-f200.google.com with SMTP id
	l4-20020a9270040000b02901bb78581beaso2087671ilc.12
	for <cluster-devel@redhat.com>; Wed, 28 Jul 2021 13:32:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=LjiLMLKMxsfIcnUNTlIQe7tETNUMfIZAXgM8SPR00cc=;
	b=ac9mo0UHlRL/XVx44FO+tx2Je7uYvdnc8CgRbC1loC+XgiYVxPop4waAolHcH3w1K+
	XXcU9WRqP8j/59IXdwPw9J+7c2s7ydJJaJa0Bg+Oc/srFVyMuw+i/u+8lgZLZl/ZBVMW
	li+8/0rJxIPMbWlCe0gzqKnI7/Gv8wwXlJ7eVoaBwbEaOdoX6V6a7w/2ZERaQ99pg7gN
	WgCyDqcXQEfa9IJCOzZXOPWPD+16tExyftH/Yt68gl5Mq2nbVeQmk2EvV2tdWEErHK6q
	TvoFTTKkRhi5TSGY8aKl5fX9bdcasWNvLEiALYxZ3+d937ZzsHfhPcLkRcwNUG8gv1VH
	4kpg==
X-Gm-Message-State: AOAM531PP1D8RXu1UQx45fpTQ76Qtgm2XKpAqAcgTtTwW1eQilY6w4oU
	Wx5S1PcbPe3ltC6b2X9uIWzc9burCU8Aq5Y9oaSKvvOXHAm0toFI8At4N7SGfYQnWnx8R/DYVnw
	Mdpp9CCmjlFlgyiyi47vBCQ03aoIyzLmtg4xJFSYeOQhKPucY8bG4kZDDcEeo6FoHeINmGCG7mQ
	==
X-Received: by 2002:a92:6610:: with SMTP id a16mr1025217ilc.71.1627504377923; 
	Wed, 28 Jul 2021 13:32:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxBF0eQ7FaXG8Htrm9cluLj2SX9PDdBmWBtwKLQUoFhu+M0SviK5oJSWhyfL40vesQCOeGfg==
X-Received: by 2002:a92:6610:: with SMTP id a16mr1025206ilc.71.1627504377702; 
	Wed, 28 Jul 2021 13:32:57 -0700 (PDT)
Received: from [172.16.0.19] (209-212-39-192.brainerd.net. [209.212.39.192])
	by smtp.gmail.com with ESMTPSA id g26sm741995ioh.48.2021.07.28.13.32.56
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 28 Jul 2021 13:32:57 -0700 (PDT)
To: Andreas Gruenbacher <agruenba@redhat.com>
References: <20210727173709.210711-1-rpeterso@redhat.com>
	<20210727173709.210711-14-rpeterso@redhat.com>
	<CAHc6FU4MUkurXhtbRrwuF846Dz7eT9+RBFntEs+_bzV6YO=GSA@mail.gmail.com>
From: Bob Peterson <rpeterso@redhat.com>
Message-ID: <0d471fd4-05e7-8b8b-6bbb-55a7cd2e72a2@redhat.com>
Date: Wed, 28 Jul 2021 15:32:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAHc6FU4MUkurXhtbRrwuF846Dz7eT9+RBFntEs+_bzV6YO=GSA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH 13/15] gfs2: ignore
 usr|grp|prjquota mount options
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/28/21 1:28 PM, Andreas Gruenbacher wrote:
> On Tue, Jul 27, 2021 at 7:37 PM Bob Peterson <rpeterso@redhat.com> wrote:
>> Before this patch, gfs2 rejected mounts attempted with the usrquota,
>> grpquota, or prjquota mount options. That caused numerous xfstests tests
>> to fail. This patch allows gfs2 to accept but ignore those mount options
>> so the tests may be run.
> 
> We can't just fake this up. Instead, the fstests need to be fixed to
> skip tests that don't run on particular filesystems.
Hi Andreas,

I see your point, and sure, the maintainers of xfstests can improve the 
tests to make them check whether the options are supported for gfs2 as
they do with other some other options.

Still, if you look at the man page for "mount(8)" under "Mount options 
for affs" you see:

"grpquota|noquota|quota|usrquota
These options are accepted but ignored.  (However, quota utilities may 
react to such strings in /etc/fstab.)"

If you look at "Mount options for jfs" you similarly see:

"noquota|quota|usrquota|grpquota
These options are accepted but ignored."

So if affs and jfs can ignore these mount options, why can't gfs2?
Are we planning to support them ever?

Bob Peterson

