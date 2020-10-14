Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E0C7D28E116
	for <lists+cluster-devel@lfdr.de>; Wed, 14 Oct 2020 15:17:04 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-EUpDIheIMWy1GIyAiVkbKg-1; Wed, 14 Oct 2020 09:17:02 -0400
X-MC-Unique: EUpDIheIMWy1GIyAiVkbKg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 019CD87952D;
	Wed, 14 Oct 2020 13:17:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2B7C19C4F;
	Wed, 14 Oct 2020 13:16:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7B2AC5810F;
	Wed, 14 Oct 2020 13:16:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09EDGtcq032572 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 14 Oct 2020 09:16:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D2CA0C0DF5; Wed, 14 Oct 2020 13:16:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD60FC0DE8
	for <cluster-devel@redhat.com>; Wed, 14 Oct 2020 13:16:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 653D080D64A
	for <cluster-devel@redhat.com>; Wed, 14 Oct 2020 13:16:53 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
	[209.85.216.41]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-410-4qL-QGJrMuuHTR6U7LgcbA-1; Wed, 14 Oct 2020 09:16:51 -0400
X-MC-Unique: 4qL-QGJrMuuHTR6U7LgcbA-1
Received: by mail-pj1-f41.google.com with SMTP id gv6so1688596pjb.4;
	Wed, 14 Oct 2020 06:16:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:in-reply-to:to:cc:from:subject:message-id:date
	:user-agent:mime-version:content-language:content-transfer-encoding;
	bh=HqH4OmL3x4PWuuqS8amqaRkrNrG5XBbpBXi9XXp9YB8=;
	b=Zr91sM06eU/VvshSF7BdXx61hpe5cGhmNGVxFXUaUoc5lNNdGDlLvpRKUZkHO7pNeK
	3OQFsIpnSM5I3GYo12JJ9GHr5HPSb+BqblQd7i3AdeFzXX2XVYM2WVOeXtZNGbKLNHyA
	LJ71r3GT5QBya59Skwm+P+cH+UxsU4w8Wda6raE3MSxtPbOs+Eqejt31qsvzXALT8AJM
	Te1YgjCa8e7AHcfPi6peL7kHFR9ULJ71h+ai/y9oe8wmdxknUL88a4rXhowI0Kw1Sw01
	YWSlAVkNDWV5uSZxhUHNKk9OEH12b7FnzJvaFXNuhvCMLA/hu7rCxDn0VMy6JhoFKINj
	Dy2A==
X-Gm-Message-State: AOAM5310gZJfZDJW3GqYLT6KMFOiuZzb7qtmtuMoNuZgflo3VdJU/HUh
	h+CSXGIja6K5Nn6iKnefHRSv7KsNdUm3M6pM3/4=
X-Google-Smtp-Source: ABdhPJxVPkd66L2M/Ql2A6T5aFDRl/Iv0Am48+p6pt60Y4FcmJMkgwQQ4fzvbHSHbY9eB+3RptqXzg==
X-Received: by 2002:a17:902:525:b029:d1:920c:c200 with SMTP id
	34-20020a1709020525b02900d1920cc200mr4236168plf.25.1602681409576;
	Wed, 14 Oct 2020 06:16:49 -0700 (PDT)
Received: from fox-laptop.local ([162.216.240.138])
	by smtp.gmail.com with ESMTPSA id y4sm3754573pgs.0.2020.10.14.06.16.44
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 14 Oct 2020 06:16:48 -0700 (PDT)
In-Reply-To: <ceed2e5f-c03e-721f-ba2f-a581d6214e5c@gmail.com>
To: Anant Thazhemadam <anant.thazhemadam@gmail.com>
From: Fox Chen <foxhlchen@gmail.com>
Message-ID: <e92ee11f-f00e-3624-acff-d37d725384cb@gmail.com>
Date: Wed, 14 Oct 2020 21:16:40 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: syzbot <syzbot+af90d47a37376844e731@syzkaller.appspotmail.com>,
	syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
	cluster-devel@redhat.com
Subject: Re: [Cluster-devel] KASAN: slab-out-of-bounds Write in,
 gfs2_fill_super
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Yes, it's the same bug,

https://lkml.org/lkml/2020/10/5/538 this may help


thanks,

