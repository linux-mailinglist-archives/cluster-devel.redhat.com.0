Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 058AB3DD23E
	for <lists+cluster-devel@lfdr.de>; Mon,  2 Aug 2021 10:48:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627894091;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fqttmnBTL3ClwMhdKL2RuW5oZVXEOr2xyH367FR/5LY=;
	b=dmzPTPIQUJztSqajtEva1rAU0ds+IKy2hsz+WZkrH2LbQuYml+3Ym47DmHNSRmgbdJISWd
	Ntqv+Q4SCNaem4gXj2SvcfXrc+lINc5XGOp6S7VQ0DtIq8BoOkGfJYENPti7f9QEKY2Wex
	6sx5eGJgBxqrDEqYvetoNM9JQjPfY1w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-wJ1nM6BKP8e_o3fTQmR8QQ-1; Mon, 02 Aug 2021 04:48:10 -0400
X-MC-Unique: wJ1nM6BKP8e_o3fTQmR8QQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E6C41853025;
	Mon,  2 Aug 2021 08:48:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AF66781E8;
	Mon,  2 Aug 2021 08:48:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C55D34BB7B;
	Mon,  2 Aug 2021 08:48:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1728kALG029447 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 2 Aug 2021 04:46:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 18B27200B685; Mon,  2 Aug 2021 08:46:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13C31202DCF4
	for <cluster-devel@redhat.com>; Mon,  2 Aug 2021 08:46:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38F0A80120D
	for <cluster-devel@redhat.com>; Mon,  2 Aug 2021 08:46:07 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
	[209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-255-4OA50U5yNjyu6V-LP-UE6Q-1; Mon, 02 Aug 2021 04:46:05 -0400
X-MC-Unique: 4OA50U5yNjyu6V-LP-UE6Q-1
Received: by mail-wm1-f70.google.com with SMTP id
	85-20020a1c01580000b02902511869b403so4863734wmb.8
	for <cluster-devel@redhat.com>; Mon, 02 Aug 2021 01:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=fqttmnBTL3ClwMhdKL2RuW5oZVXEOr2xyH367FR/5LY=;
	b=TV4FFtka66EIY0fqa2MTNsRH1AEM222YJhHgmucMINuwGEBEVI2gKvvGdY5uoDuTnE
	/aWLjd8ZFkGI7GD6JlNQdQkCF/BqQO0bpKhHHYFOecWGUN+xo1OOjmTXV6Z8KniiWAWi
	BgX4avQNu9SujxMo2MNf6IA+QKQBLCL98oVmw7vFzZxHqDy33U0uiKD1nt62BinRpDS5
	m0KoxBiPclNLs57xctpDpKHTCzbuDvXRCulZcWXGd8FxI1bU3PtbH5X3wMODBFY42Q5a
	wtUjFV/nRtDuNEb5B+31M3SVGl5uTs0GxbzQOP/NFuX5eXYdqRPR549whQwoiWYHVqV4
	IzOA==
X-Gm-Message-State: AOAM531UJCKzj1D44Z2utjB6Wz5E7Fe0Ym9N9hUT063OAQBmSgn2Ashz
	KKvTFJJeQNSIjfSfBtNFU8blgKD9esHXiHhSGtV/lvZsDBs0mn6K4m5xyqmxnq2UDJfC0nzOKpn
	FkYS3gIJ4Oi2NCR7UiHHhlzb7AJDWtKEv10LGoX1u6Eyy2Bf7Fbk2jwu+6ij+q23FcBcYJZ2D
X-Received: by 2002:a1c:7c04:: with SMTP id x4mr16021503wmc.48.1627893964660; 
	Mon, 02 Aug 2021 01:46:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfk5nRkd1AIJVtcu49w4rXcHPDQyA5XlyA8/vZgluiY8O5KjKgXxQAQvxuegRHkcVpLei31Q==
X-Received: by 2002:a1c:7c04:: with SMTP id x4mr16021481wmc.48.1627893964499; 
	Mon, 02 Aug 2021 01:46:04 -0700 (PDT)
Received: from [192.168.1.146]
	(cpc76484-cwma10-2-0-cust967.7-3.cable.virginm.net. [82.31.203.200])
	by smtp.gmail.com with ESMTPSA id
	i7sm10930244wre.64.2021.08.02.01.46.03
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 02 Aug 2021 01:46:04 -0700 (PDT)
To: Bob Peterson <rpeterso@redhat.com>,
	Andreas Gruenbacher <agruenba@redhat.com>
References: <20210727173709.210711-1-rpeterso@redhat.com>
	<20210727173709.210711-14-rpeterso@redhat.com>
	<CAHc6FU4MUkurXhtbRrwuF846Dz7eT9+RBFntEs+_bzV6YO=GSA@mail.gmail.com>
	<0d471fd4-05e7-8b8b-6bbb-55a7cd2e72a2@redhat.com>
From: Andrew Price <anprice@redhat.com>
Message-ID: <93c92609-33a8-c9b9-a750-0bfbd6d8a882@redhat.com>
Date: Mon, 2 Aug 2021 09:46:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <0d471fd4-05e7-8b8b-6bbb-55a7cd2e72a2@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 28/07/2021 21:32, Bob Peterson wrote:
> On 7/28/21 1:28 PM, Andreas Gruenbacher wrote:
>> On Tue, Jul 27, 2021 at 7:37 PM Bob Peterson <rpeterso@redhat.com> wrote:
>>> Before this patch, gfs2 rejected mounts attempted with the usrquota,
>>> grpquota, or prjquota mount options. That caused numerous xfstests tests
>>> to fail. This patch allows gfs2 to accept but ignore those mount options
>>> so the tests may be run.
>>
>> We can't just fake this up. Instead, the fstests need to be fixed to
>> skip tests that don't run on particular filesystems.
> Hi Andreas,
> 
> I see your point, and sure, the maintainers of xfstests can improve the 
> tests to make them check whether the options are supported for gfs2 as
> they do with other some other options.
> 
> Still, if you look at the man page for "mount(8)" under "Mount options 
> for affs" you see:
> 
> "grpquota|noquota|quota|usrquota
> These options are accepted but ignored.  (However, quota utilities may 
> react to such strings in /etc/fstab.)"
> 
> If you look at "Mount options for jfs" you similarly see:
> 
> "noquota|quota|usrquota|grpquota
> These options are accepted but ignored."
> 
> So if affs and jfs can ignore these mount options, why can't gfs2?
> Are we planning to support them ever?
FWIW I agree with Andreas, this is definitely a bug in the test suite. 
If we fix fstests then we can use fstests for bisecting older gfs2 
issues, but if we no-op incompatible mount options that make their way 
into the generic tests then we're only fixing the tests for future gfs2 
versions and not older ones.

Andy

