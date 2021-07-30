Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id ECB293DBE63
	for <lists+cluster-devel@lfdr.de>; Fri, 30 Jul 2021 20:32:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627669979;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vTR3UEJYwf8oBgpukmumsoAL2iYg+soQFo59MzS1zRw=;
	b=c6V6UzSvV5eFvnazOdiYKugBqJsmrlpeA/4l2krSLq0c/WqZsDWfVpNHr5FdM+1r6Bowzx
	8cJnpA4jEZqKJOXHISoR/l7w2T37HnUAvDG6XGFrsD9sfIquNrKeg+ONwll/84SCEYZ4VX
	uUqAgf6788Zj1c2i3VhlZ2p3E6wBSs8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-4WGs7bbQM-iE7Qmfk5kqbg-1; Fri, 30 Jul 2021 14:32:57 -0400
X-MC-Unique: 4WGs7bbQM-iE7Qmfk5kqbg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC820190B2AB;
	Fri, 30 Jul 2021 18:32:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8694260C05;
	Fri, 30 Jul 2021 18:32:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4457B4BB7C;
	Fri, 30 Jul 2021 18:32:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16UIWpuW024440 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 30 Jul 2021 14:32:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6482410551AB; Fri, 30 Jul 2021 18:32:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 605071134CA6
	for <cluster-devel@redhat.com>; Fri, 30 Jul 2021 18:32:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F5E2101A529
	for <cluster-devel@redhat.com>; Fri, 30 Jul 2021 18:32:48 +0000 (UTC)
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
	[209.85.166.198]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-372-jPhGkIJxOvyXMna5x4MI7g-1; Fri, 30 Jul 2021 14:32:46 -0400
X-MC-Unique: jPhGkIJxOvyXMna5x4MI7g-1
Received: by mail-il1-f198.google.com with SMTP id
	d6-20020a056e020506b0290208fe58bd16so5515860ils.0
	for <cluster-devel@redhat.com>; Fri, 30 Jul 2021 11:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=vTR3UEJYwf8oBgpukmumsoAL2iYg+soQFo59MzS1zRw=;
	b=aqkNNbXfbmufUv9yoiEBbe1i1uGTFDPoOer9S0/3f5KT4rYIEBz6Lm5FeSI1KWhBwJ
	0jbjbq2PLY58p864TvzhAkhuvqlNGR35gYXdgpg5nMasYEokm/AtEpjEycxoc3IVyaqJ
	CjJcHgJRSRdELwCkW0uB44w7+DroCct2g5A6LJQyg2MqOoka36IgUIOVRPfVdjx6XFz+
	qDFqUHlA4fGEL9R1wd4HsItxr940scp8CZvYnCDSJFKVEGtjWoqbmvm7PGCMaVZ1qhnt
	m0r1HecuZS8kFv7d0DCkI7h6Ubx3gufl9nvzcWYJQPY/+vp8JFUCVfqe+4ODtcVgwxx1
	EN7Q==
X-Gm-Message-State: AOAM531t3McZx1QAadU8xjyR1rGDIS8ubLkU2E00WKUHimnUXbM3F6O5
	FUmz0v8ljpI8hbwCqil75KeoCI0uu/F9VAYmhbrWP7a5DaBaMhGlFQVKMC/xohQeoiF8FMonTkP
	3WnBAzL0o2ADDbPfJ/LYbboHdskEtsG7TQlTG49zCL6FJ7cIm17wGA3yFIS8RDI0QzrVOWJNd4g
	==
X-Received: by 2002:a92:7d08:: with SMTP id y8mr353660ilc.111.1627669965941;
	Fri, 30 Jul 2021 11:32:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtE417r/lC/xEYbFXB4GQHB9OfEBq0lOgut54Dm2yvtEQnSNkqPTic7hsr4vd6oB2ufHL8VQ==
X-Received: by 2002:a92:7d08:: with SMTP id y8mr353646ilc.111.1627669965730;
	Fri, 30 Jul 2021 11:32:45 -0700 (PDT)
Received: from [172.16.0.19] (209-212-39-192.brainerd.net. [209.212.39.192])
	by smtp.gmail.com with ESMTPSA id w1sm1140009ilv.59.2021.07.30.11.32.44
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 30 Jul 2021 11:32:44 -0700 (PDT)
To: Dan Carpenter <dan.carpenter@oracle.com>, cluster-devel@redhat.com
References: <20210728083128.GA22963@kili>
From: Bob Peterson <rpeterso@redhat.com>
Message-ID: <83ab1293-f518-a176-ac60-296c905d24d6@redhat.com>
Date: Fri, 30 Jul 2021 13:32:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728083128.GA22963@kili>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [bug report] GFS2: Fix bug-trap in ail flush
	code
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

On 7/28/21 3:31 AM, Dan Carpenter wrote:
> 
> Hi GFS2 devs,
> 
> This is 10 year old code, but it looks suspicious and hopefully the
> recovery code doesn't get testing very often in runtime.
> 
> The patch 75549186edf1: "GFS2: Fix bug-trap in ail flush code" from
> Aug 2, 2011, leads to the following static checker warning:
> 
> 	fs/gfs2/glock.c:1487 gfs2_glock_dq()
> 	warn: sleeping in atomic context
> 
> fs/gfs2/glops.c
>      57  static void __gfs2_ail_flush(struct gfs2_glock *gl, bool fsync,
>      58                               unsigned int nr_revokes)
>      59  {
>      60          struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
>      61          struct list_head *head = &gl->gl_ail_list;
>      62          struct gfs2_bufdata *bd, *tmp;
>      63          struct buffer_head *bh;
>      64          const unsigned long b_state = (1UL << BH_Dirty)|(1UL << BH_Pinned)|(1UL << BH_Lock);
>      65
>      66          gfs2_log_lock(sdp);
>                  ^^^^^^^^^^^^^^^^^^
>      67          spin_lock(&sdp->sd_ail_lock);
>                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> We're holding a spinlock here
> 
>      68          list_for_each_entry_safe_reverse(bd, tmp, head, bd_ail_gl_list) {
>      69                  if (nr_revokes == 0)
>      70                          break;
>      71                  bh = bd->bd_bh;
>      72                  if (bh->b_state & b_state) {
>      73                          if (fsync)
>      74                                  continue;
>      75                          gfs2_ail_error(gl, bh);
>                                  ^^^^^^^^^^^^^^^^^^^^^^
> The gfs2_ail_error() function calls gfs2_withdraw() which can sleep or
> the call tree that this is complains about is:
> 
> --> gfs2_ail_error()
>     --> gfs2_withdraw()
>      --> signal_our_withdraw()
>          -->gfs2_glock_dq()
> 
> It's also very possible that this is a false positive...  Smatch doesn't
> understand bit tests very well and especially across function
> boundaries.
> 
>      76                  }
>      77                  gfs2_trans_add_revoke(sdp, bd);
>      78                  nr_revokes--;
>      79          }
>      80          GLOCK_BUG_ON(gl, !fsync && atomic_read(&gl->gl_ail_count));
>      81          spin_unlock(&sdp->sd_ail_lock);
>      82          gfs2_log_unlock(sdp);
>      83  }
> 
> regards,
> dan carpenter
> 
Hi Dan,

Thanks. I don't think it's a false positive. I think we should be using 
a delayed withdraw rather than an actual withdraw. I'll send a patch out 
to fix it shortly.

Regards,

Bob Peterson

