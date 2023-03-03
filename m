Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE886A99B4
	for <lists+cluster-devel@lfdr.de>; Fri,  3 Mar 2023 15:41:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677854466;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zRO0cXuzOUByfv/KOgAQnM70B++Dm7ltDo6mvs2ym/k=;
	b=ZSK5BnrHuKdpSFvY0eNtVuw5xL8VJq78A6MnJ0h3fYWMYoAwk4cKkhp/iNh0cD36aMqdsf
	SvNfb9yCB/NMkqBskpbPt0Kqp3VF1zEogV4A9obrVHjQ9QTQDr9JlGugf+d+Dcv/Ph/Fkw
	4qk1yGW+kFuHMeKJSaZRLln8P7qK3pc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-vX8H0WTeOrqU15hDhWrxeg-1; Fri, 03 Mar 2023 09:41:02 -0500
X-MC-Unique: vX8H0WTeOrqU15hDhWrxeg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7D233C20EE0;
	Fri,  3 Mar 2023 14:41:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EE1B240C6EC4;
	Fri,  3 Mar 2023 14:41:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AC8B919452D0;
	Fri,  3 Mar 2023 14:40:55 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1A26B19465A0 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  3 Mar 2023 14:40:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0B27140B40E4; Fri,  3 Mar 2023 14:40:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 03EC840B40DF
 for <cluster-devel@redhat.com>; Fri,  3 Mar 2023 14:40:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D779F811E6E
 for <cluster-devel@redhat.com>; Fri,  3 Mar 2023 14:40:54 +0000 (UTC)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-a6oz0bE3PRuxxiaR4Z8mmw-1; Fri, 03 Mar 2023 09:40:53 -0500
X-MC-Unique: a6oz0bE3PRuxxiaR4Z8mmw-1
Received: by mail-ed1-f69.google.com with SMTP id
 cf11-20020a0564020b8b00b0049ec3a108beso4266051edb.7
 for <cluster-devel@redhat.com>; Fri, 03 Mar 2023 06:40:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677854448;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zRO0cXuzOUByfv/KOgAQnM70B++Dm7ltDo6mvs2ym/k=;
 b=157KpDGDeWrrZARdz59zUeeJ3thsc014zn8B8suTRlP3Jh2NVwy1hWu7Sc/sntzbWy
 gCPvgZO2VV0SiT93AI+wfV79iah16vav1RXnIeflElWAI9Vy5LWiYPHCIDVbdKCRLEAt
 iSyEORPLZuz1ZlCvc0idd6zbW3JnLDDF1ZosYhPKCyeu7lZEQunj0WGd5/lUOWzX+h+n
 sazQQTWd3pNULSjYmcuxSTLmHvWt5NvEI/0N3kwCT2tCzUq5IPji8ppIVn9MQzmxreMy
 z1Y0pzkf29VrUjzNbgnTqt/qa3VXjJqIKoHBvnrcScwRg7/ZdY0vdWEeggoBogxPvOPa
 ALCw==
X-Gm-Message-State: AO0yUKWH51ZqzbCgolZkuO0cLEMr72AyhjW0z26Y6z1lzM1lv1ucD+2u
 VgEwdRWYH6vpf/baewDXF/JwwgDonHodf4Qh7y2sFqNL995y6EjPKCV1bGFUOvIXZDbpZKL6UH+
 uQb05sg/QKsgt/Ct0AuhSMak/x0QFDVFV57gZ90twhimuDQ==
X-Received: by 2002:a17:906:747:b0:87b:dce7:c245 with SMTP id
 z7-20020a170906074700b0087bdce7c245mr893688ejb.3.1677854448459; 
 Fri, 03 Mar 2023 06:40:48 -0800 (PST)
X-Google-Smtp-Source: AK7set8P/CXjZH8Y4qk9JpmHpbbzHKhzEXZrEhNoubWY2NQDe6mxpyg5w7G97UN8iWcDpi1T2grcSGtImrAPg7m4V5k=
X-Received: by 2002:a17:906:747:b0:87b:dce7:c245 with SMTP id
 z7-20020a170906074700b0087bdce7c245mr893680ejb.3.1677854448143; Fri, 03 Mar
 2023 06:40:48 -0800 (PST)
MIME-Version: 1.0
References: <20230302171441.1509914-1-aahringo@redhat.com>
 <20230302171441.1509914-14-aahringo@redhat.com>
In-Reply-To: <20230302171441.1509914-14-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Fri, 3 Mar 2023 09:40:36 -0500
Message-ID: <CAK-6q+jk5MQHsw_=H=Wjpp+dYE-X=f5rvtT+hgu7PN8_vDkdJA@mail.gmail.com>
To: teigland@redhat.com
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [PATCH dlm-tool 14/14] python: add posix lockdb
 plot tool
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 2, 2023 at 12:14=E2=80=AFPM Alexander Aring <aahringo@redhat.co=
m> wrote:
>
> This patch adds a python tool to plot with use of python plotly [0] the
> dlm_controld cluster-wide lockdb. It scans dlm_controld plock log files
> for the required information about possible contention (waiters) and the
> acquired lock modes over time.
>
> Example:
>
> ./lockdb_plot /var/log/dlm_controld/plock.log
>
> and plotly will start a webserver and you can see a generated, interactiv=
e
> plot about the lockranges in y axis and time in x axis. Depending on
> usage it's limited and does not scale. Ther exists arguments like --info
> to get plock.log timing information and with --ts_start/ts_end you can
> filter a specific time range to only show a small part of the plock log
> to reduce the amount of rectangles need to be drawn by the browser.
>
> It shows only lock modes and contention, no lock requests. Means A tryloc=
k
> is only visible when it was successful. A non trylock will be drawn and
> has possible contention.
>
> With this plot it should be easy to figure out on which node a specific
> lock range was acquired and resulted in contention.
>
> [0] https://plotly.com/python/
> ---
>  python/tools/lockdb_plot | 429 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 429 insertions(+)
>  create mode 100755 python/tools/lockdb_plot
>
> diff --git a/python/tools/lockdb_plot b/python/tools/lockdb_plot
> new file mode 100755
> index 00000000..761bdea2
> --- /dev/null
> +++ b/python/tools/lockdb_plot
> @@ -0,0 +1,429 @@
> +#!/usr/bin/env python3
> +
> +import plotly.graph_objects as go
> +from enum import Enum
> +import argparse
> +import sys
> +
> +NSECS_PER_SECS =3D 1000000000
> +
> +def nsecs_to_secs(nsecs):
> +    return nsecs/NSECS_PER_SECS
> +
> +def secs_to_nsecs(secs):
> +    return secs * NSECS_PER_SECS
> +
> +# entry point of collecting data
> +nodes =3D dict()
> +# will parse log to get our_nodeid
> +our_nodeid =3D None
> +# legend groups, tmp set to show legend entry only once
> +legend_groups =3D set()
> +
> +class EType(Enum):
> +    LOCK =3D 1
> +    WAITER =3D 2
> +
> +def lookup_lockdb(nodeid, ls, number):
> +    if nodeid not in nodes:
> +        nodes[nodeid] =3D dict()
> +
> +    lockspaces =3D nodes[nodeid]
> +    if ls not in lockspaces:
> +        lockspaces[ls] =3D dict()
> +
> +    if number not in lockspaces[ls]:
> +        lockspaces[ls][number] =3D LockDb(nodeid, ls, number)
> +
> +    return lockspaces[ls][number]
> +
> +def plotly_rect_shape(x0, y0, x1, y1, color, opacity, text, group):
> +    # we show it in secs
> +    x0 =3D nsecs_to_secs(x0)
> +    x1 =3D nsecs_to_secs(x1)
> +
> +    rv =3D go.Scatter(x=3D[x0,x0,x1,x1,x0],
> +                    y=3D[y0,y1,y1,y0,y0],
> +                    fill=3D"toself",
> +                    fillcolor=3Dcolor,
> +                    mode=3D'lines',
> +                    name=3Dgroup,
> +                    legendgroup=3Dgroup,
> +                    showlegend=3Dgroup not in legend_groups,
> +                    visible=3DTrue,
> +                    text=3Dtext,
> +                    line=3Ddict(color=3Dcolor,
> +                              width=3D1),
> +                    opacity=3Dopacity)
> +
> +    legend_groups.add(group)
> +    return rv
> +
> +
> +class LockDbRect():
> +    def __init__(self, **kwargs):
> +        self.ls =3D kwargs["ls"]
> +        self.number =3D kwargs["number"]
> +        self.pid =3D kwargs["pid"]
> +        self.nodeid =3D kwargs["nodeid"]
> +        self.owner =3D kwargs["owner"]
> +        self.ts_start =3D kwargs["ts_start"]
> +        self.ts_end =3D kwargs["ts_end"]
> +        # +1 because lock range 1000-1000 will then be 999-1000
> +        # exclusive vs inclusive we need to decide how to display
> +        # it but we don't set a zero height
> +        self.lk_start =3D kwargs["lk_start"] - 1
> +        self.lk_end =3D kwargs["lk_end"]
> +
> +    def create_shape(self):
> +        return plotly_rect_shape(self.ts_start,
> +                                 self.lk_start,
> +                                 self.ts_end,
> +                                 self.lk_end,
> +                                 self.get_color(),
> +                                 self.get_opacity(),
> +                                 self.get_text(),
> +                                 self.get_group())
> +
> +    def get_duration(self):
> +        return self.ts_end - self.ts_start
> +
> +    def get_range(self):
> +        return self.lk_end - self.lk_start
> +
> +    def __str__(self):
> +        return str(self.__dict__)
> +
> +    def __repr__(self):
> +        return str(self)
> +
> +class LockDbRectWaiter(LockDbRect):
> +    def __init__(self, **kwargs):
> +        super(LockDbRectWaiter, self).__init__(**kwargs)
> +
> +    def get_color(self):
> +        return "green"
> +
> +    def get_opacity(self):
> +        return 0.2
> +
> +    def get_text(self):
> +        # TODO make it human readable for high numbers?
> +        ts_start =3D nsecs_to_secs(self.ts_start);
> +        ts_end =3D nsecs_to_secs(self.ts_end);
> +        dt =3D nsecs_to_secs(self.get_duration());
> +
> +        text =3D "nodeid: {}, pid: {}, owner: {}<br>".format(self.nodeid=
, self.pid, hex(self.owner)) + \
> +               "ts_start: {0:.3f},".format(ts_start) + \
> +               "ts_end: {0:.3f},".format(ts_end) + \
> +               "dt: {0:.3f}<br>".format(dt) + \
> +               "lk_start: {}, lk_end: {}, dy: {}<br>".format(hex(self.lk=
_start), hex(self.lk_end), hex(self.get_range()))
> +
> +        return text
> +
> +    def get_text_pl(self):
> +        text =3D "contention:<br>" + \
> +                "start: {0:.3f},".format(nsecs_to_secs(self.ts_start)) +=
 \
> +                "end: {0:.3f},".format(nsecs_to_secs(self.ts_end)) + \
> +                "dt: {0:.3f}".format(nsecs_to_secs(self.get_duration()))
> +
there are some missing spaces after each comma. I will try to add a
function and use this function for the same code below.

> +        return text
> +
> +    def get_group(self):
> +        return "contention"
> +
> +class LockDbRectPLock(LockDbRect):
> +    def __init__(self, **kwargs):
> +        super(LockDbRectPLock, self).__init__(**kwargs)
> +        self.mode =3D kwargs["mode"]
> +        if self.mode =3D=3D "WR":
> +            self.color =3D "red"
> +            self.group =3D "write lock"
> +        elif self.mode =3D=3D "RD":
> +            self.color =3D "blue"
> +            self.group =3D "read lock"
> +        else:
> +            print("{}: received unknown mode".format(self.ts_start))
> +            return
> +
> +        self.waiter =3D None
> +
> +    def __str__(self):
> +        return str(self.__dict__)
> +
> +    def __repr__(self):
> +        return str(self)
> +
> +    def has_waiter(self):
> +        return self.waiter
> +
> +    def set_waiter(self, wa):
> +        if self.has_waiter():
> +            print("{}: has already a waiter set".format(self.ts_start))
> +            return
> +
> +        self.waiter =3D wa
> +
> +    def get_waiter(self):
> +        return self.waiter
> +
> +    def get_color(self):
> +        return self.color
> +
> +    def get_opacity(self):
> +        return 0.4
> +
> +    def get_text(self):
> +        # TODO make it human readable for high numbers?
> +        ts_start =3D nsecs_to_secs(self.ts_start);
> +        ts_end =3D nsecs_to_secs(self.ts_end);
> +        dt =3D nsecs_to_secs(self.get_duration());
> +
> +        text =3D "nodeid: {}, pid: {}, owner: {}<br>".format(self.nodeid=
, self.pid, hex(self.owner)) + \
> +               "ts_start: {0:.3f},".format(ts_start) + \
> +               "ts_end: {0:.3f},".format(ts_end) + \
> +               "dt: {0:.3f}<br>".format(dt) + \

here...

> +               "lk_start: {}, lk_end: {}, dy: {}<br>".format(hex(self.lk=
_start), hex(self.lk_end), hex(self.get_range()))
> +
> +        if self.has_waiter():
> +            text =3D text + "<br>{}".format(self.get_waiter().get_text_p=
l())
> +
> +        return text;
> +
> +    def get_group(self):
> +        return self.group
> +
> +class LockDb:
> +    def __init__(self, nodeid, ls, number):
> +        self.nodeid =3D nodeid
> +        self.ls =3D ls
> +        self.number =3D number
> +        self.__ts =3D dict()
> +        self.plocks =3D list()
> +        self.__last_plock =3D dict()
> +        self.waiters =3D list()
> +        self.__last_waiter =3D dict()
> +        self.__ts_start_min =3D None
> +        self.__ts_end_max =3D 0
> +
> +    def event_start(self, vals):
> +        self.__ts[vals["ptr"]] =3D vals
> +
> +    def __plock(self, vals_start, vals_end):
> +        pl =3D LockDbRectPLock(ls=3Dvals_start["ls"],
> +                             number=3Dvals_start["number"],
> +                             pid=3Dvals_start["pid"],
> +                             nodeid=3Dvals_start["nodeid"],
> +                             owner=3Dvals_start["owner"],
> +                             ts_start=3Dvals_start["ts"],
> +                             ts_end=3Dvals_end["ts"],
> +                             lk_start=3Dvals_start["start"],
> +                             lk_end=3Dvals_start["end"],
> +                             mode=3Dvals_start["mode"])
> +        self.plocks.append(pl)
> +        self.__last_plock[vals_end["ptr"]] =3D pl
> +
> +        try:
> +            pl.set_waiter(self.__last_waiter[vals_start["owner"]])
> +            del(self.__last_waiter[vals_start["owner"]])
> +        except KeyError:
> +            pass
> +
> +    def __waiter(self, vals_start, vals_end):
> +        wa =3D LockDbRectWaiter(ls=3Dvals_start["ls"],
> +                              number=3Dvals_start["number"],
> +                              pid=3Dvals_start["pid"],
> +                              nodeid=3Dvals_start["nodeid"],
> +                              owner=3Dvals_start["owner"],
> +                              ts_start=3Dvals_start["ts"],
> +                              ts_end=3Dvals_end["ts"],
> +                              lk_start=3Dvals_start["start"],
> +                              lk_end=3Dvals_start["end"])
> +        self.waiters.append(wa)
> +        self.__last_waiter[vals_start["owner"]] =3D wa
> +
> +    def event_end(self, vals):
> +        try:
> +            vals_start =3D self.__ts[vals["ptr"]]
> +            del(self.__ts[vals["ptr"]])
> +        except KeyError:
> +            print("{}: cannot find previous start, ignoring".format(vals=
["ts"]))
> +            return
> +
> +        if not self.__ts_start_min:
> +            self.__ts_start_min =3D vals_start["ts"]
> +        else:
> +            self.__ts_start_min =3D min(self.__ts_start_min, vals_start[=
"ts"])
> +
> +        if not self.__ts_start_min:
> +            self.__ts_end_max =3D vals["ts"]
> +        else:
> +            self.__ts_end_max =3D max(self.__ts_end_max, vals["ts"])
> +
> +        if vals["event"] =3D=3D EType.LOCK:
> +            self.__plock(vals_start, vals)
> +        elif vals["event"] =3D=3D EType.WAITER:
> +            self.__waiter(vals_start, vals)
> +        else:
> +            print("{}: unknown event type".format(vals["ts"]))
> +
> +    def add_shapes(self, fig):
> +        global legend_groups
> +        legend_groups =3D set()
> +
> +        # first waiters to be in background
> +        for wa in self.waiters:
> +            fig.add_trace(wa.create_shape())
> +
> +        # next layer to draw lock states
> +        for pl in self.plocks:
> +            fig.add_trace(pl.create_shape())
> +
> +    def get_ts_min(self):
> +        return self.__ts_start_min
> +
> +    def get_ts_max(self):
> +        return self.__ts_end_max
> +
> +    def __str__(self):
> +        return "ls {} inode {}".format(self.ls, self.number)
> +
> +    def __repr__(self):
> +        return str(self)
> +
> +parser =3D argparse.ArgumentParser(description=3D"Plots dlm_controld loc=
k databases")
> +parser.add_argument('-i', "--info", action=3D"store_true")
> +parser.add_argument('-s', "--ts_start", type=3Dfloat)
> +parser.add_argument('-e', "--ts_end", type=3Dfloat)
> +
> +parser.add_argument('plock_logs', type=3Dargparse.FileType('r'), nargs=
=3D'+')
> +args =3D parser.parse_args()
> +
> +for f in args.plock_logs:
> +    lines =3D f.readlines()
> +
> +    # Current way to figure out our nodeid
> +    for line in lines:
> +        if "read plock" in line:
> +            lsplit =3D line.split()
> +            npo =3D lsplit[11].split('/')
> +            nodeid =3D int(npo[0])
> +            our_nodeid =3D nodeid
> +            break
> +
> +    if not our_nodeid:
> +        print("{}: could not determine our nodeid".format(f))
> +        continue
> +
> +    for line in lines:
> +        if "state plock" in line:
> +            pass
> +        elif "state waiter" in line:
> +            pass
> +        else:
> +            continue
> +
> +        vals =3D dict()
> +        lsplit =3D line.split()
> +        vals["ts"] =3D int(lsplit[3])
> +
> +        if args.ts_start and secs_to_nsecs(args.ts_start) > int(vals["ts=
"]):
> +            continue
> +
> +        if args.ts_end and secs_to_nsecs(args.ts_end) < int(vals["ts"]):
> +            break;
> +
> +        vals["ls"] =3D lsplit[4]
> +        vals["op"] =3D lsplit[7]
> +        vals["number"] =3D int(lsplit[8], 16)
> +        vals["ptr"] =3D lsplit[9]
> +
> +        db =3D lookup_lockdb(our_nodeid, vals["ls"], vals["number"])
> +        if "state plock" in line:
> +            vals["event"] =3D EType.LOCK
> +            if vals["op"] =3D=3D "start":
> +                vals["mode"] =3D lsplit[10]
> +                se =3D lsplit[11].split('-')
> +                vals["start"] =3D int(se[0], 16)
> +                vals["end"] =3D int(se[1], 16)
> +                npo =3D lsplit[12].split('/')
> +                vals["nodeid"] =3D int(npo[0])
> +                vals["pid"] =3D int(npo[1])
> +                vals["owner"] =3D int(npo[2], 16)
> +                db.event_start(vals)
> +            elif vals["op"] =3D=3D"end":
> +                db.event_end(vals)
> +            else:
> +                print("{}: unknown state plock operation: {}".format(val=
s["ts"], vals["op"]))
> +        elif "state waiter" in line:
> +            vals["event"] =3D EType.WAITER
> +            if vals["op"] =3D=3D "start":
> +                se =3D lsplit[10].split('-')
> +                vals["start"] =3D int(se[0], 16)
> +                vals["end"] =3D int(se[1], 16)
> +                npo =3D lsplit[11].split('/')
> +                vals["nodeid"] =3D int(npo[0])
> +                vals["pid"] =3D int(npo[1])
> +                vals["owner"] =3D int(npo[2], 16)
> +                db.event_start(vals)
> +            elif vals["op"] =3D=3D "end":
> +                db.event_end(vals)
> +            else:
> +                print("{}: unknown state waiter operation: {}".format(va=
ls["ts"], vals["op"]))
> +        else:
> +            print("received unknown line event: {}".format(line))
> +
> +if args.info:
> +    ts_max =3D None
> +    ts_min =3D None
> +
> +    for nodeid in nodes:
> +        for ls in nodes[nodeid]:
> +            for number in nodes[nodeid][ls]:
> +                db =3D lookup_lockdb(nodeid, ls, number)
> +                if not ts_min:
> +                    ts_min =3D db.get_ts_min()
> +                else:
> +                    ts_min =3D min(ts_min, db.get_ts_min())
> +
> +                if not ts_max:
> +                    ts_max =3D db.get_ts_max()
> +                else:
> +                    ts_max =3D min(ts_max, db.get_ts_max())
> +
> +    print("global info:")
> +    print("\tts_start: {0:.3f} secs".format(nsecs_to_secs(ts_min)))
> +    print("\tts_end: {0:.3f} secs".format(nsecs_to_secs(ts_max)))
> +    print("\tduration: {0:.3f} secs".format(nsecs_to_secs(ts_max) - nsec=
s_to_secs(ts_min)))
> +
> +    print()
> +    print("per inode lock info:")
> +    for nodeid in nodes:
> +        print("nodeid: {}".format(nodeid))
> +        for ls in nodes[nodeid]:
> +            print("\tls: {}".format(ls))
> +            for number in nodes[nodeid][ls]:
> +                print("\t\tinode: {}".format(hex(number)))
> +                db =3D lookup_lockdb(nodeid, ls, number)
> +                print("\t\t\tts_start: {0:.3f} secs".format(nsecs_to_sec=
s(db.get_ts_min())))
> +                print("\t\t\tts_end: {0:.3f} secs".format(nsecs_to_secs(=
db.get_ts_max())))
> +                print("\t\t\tduration: {0:.3f} secs".format(nsecs_to_sec=
s(db.get_ts_max()) - nsecs_to_secs(db.get_ts_min())))
> +

I will add a "top 5" high score of the longest duration of contention
state... So if somebody is looking for long contention states it is
easy to find them with a fast parsing of the log files.

- Alex

